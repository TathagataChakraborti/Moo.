#!/usr/bin/env bash

'''
packages
'''

import openpyxl as xl

'''
global variables 
'''

students   = {}
tutorials  = {}
activities = {}

'''
method :: cache xlxs
'''
def cache(filename = '../data/student_data.xlsx'):

	def read_sheet(sheet_name, min_row, max_col, max_row):

		temp = {}
		keys = [str(item.value) for item in wb[sheet_name][1]][:max_col]

		for row in wb[sheet_name].iter_rows(min_row=min_row, max_col=max_col, max_row=max_row):

			temp[str(row[0].value)] = {}
			for i in range(1, len(keys)):
				temp[str(row[0].value)][keys[i]] = str(row[i].value)

		return temp

	global students, tutorials, activities

	wb = xl.load_workbook(filename)

	students   = read_sheet('Students', 2, 8, 6)
	tutorials  = read_sheet('Tutorials', 2, 5, 14)
	activities = read_sheet('Activities', 2, 5, 7)

'''
method :: write fwd files
'''
def ():


'''
method :: main
'''
def main():
	cache()

if __name__ == "__main__":
	main()
	   
