#!/usr/bin/env bash

'''
packages
'''

import openpyxl as xl
import argparse, sys

'''
global variables 
'''

students   = {}
tutorials  = {}
activities = {}

tutorial_cost = 9
student_ID    = 'S5'

'''
action blobs 
'''

action_set_concepts  = '(:action set_concepts_{}\n:parameters (?s - student)\n:precondition (and\n(done ?s {})\n)\n:effect (and\n{}\n(increase (total-cost) 0)\n)\n)\n\n'
action_do_tutorial   = '(:action do_tutorial_{}\n:parameters (?s - student)\n:precondition (and)\n:effect (and\n{}\n(increase (total-cost) {})\n)\n)\n\n'
action_do_activity   = '(:action do_activity_{}\n:parameters (?s - student)\n:precondition (and\n(not (lock ?s))\n(not (done ?s {}))\n)\n:effect (and\n(lock ?s)\n(todo {} ?s)\n{}\n(need_contribution {})\n(increase (total-cost) 1)\n)\n)\n\n'
action_done_activity = '(:action done_activity_{}\n:parameters (?s - student)\n:precondition (and\n(todo {} ?s)\n{}\n)\n:effect (and\n(not (lock ?s))\n(not (todo {} ?s))\n(done ?s {})\n{}\n(increase (total-cost) 0)\n)\n)\n\n'

'''
method :: cache xlxs 
note   :: change with call to DB
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
method :: write act files
'''
def write_act_files():
	pass

'''
method :: write fwd files
'''
def write_fwd_files():

	print 'Writing FWD files...'

	# read current class information	
	cache()

	# write problem file
	with open('problem-fwd-template.pddl', 'r') as template:
		problem_template = template.read()

	problem_template = problem_template.replace('{S}', ' '.join(students.keys()))

	concepts = set()

	for key in tutorials.keys():
		for item in tutorials[key]['Concepts'].split(','):
			concepts.add(item.strip())

	problem_template = problem_template.replace('{C}', ' '.join(concepts))

	problem_template = problem_template.replace('{T}', ' '.join(tutorials.keys()))
	problem_template = problem_template.replace('{A}', ' '.join(activities.keys()))

	init_string = ''

	for student in students.keys():

		for item in students[student]['Tutorials Completed'].strip().split(','):
			if item.strip() != 'None':
				init_string += '(done {} {})\n'.format(student, item.strip())

		for item in students[student]['Activities Completed'].strip().split(','):
			if item.strip() != 'None':
				init_string += '(done {} {})\n'.format(student, item.strip())

	problem_template = problem_template.replace('{I}', init_string.strip())

	goal_string = ''

	for student in students.keys():
		goal_string += '(not (lock {}))\n'.format(student)

	for concept in concepts:
		goal_string += '(used_concept {} {})\n'.format(student_ID, concept)

	problem_template = problem_template.replace('{G}', goal_string.strip())

	with open('problem-fwd.pddl', 'w') as template:
		template.write(problem_template)

	# write domain file
	with open('domain-fwd-template.pddl', 'r') as template:
		domain_template = template.read()

	action_string = ''

	for tutorial in tutorials.keys():

		new_action = action_set_concepts

		temp = ''
		for item in tutorials[tutorial]['Concepts'].strip().split(','):
			if item.strip() != 'None':
				temp += '(has_concept ?s {})\n'.format(item.strip())

		new_action = new_action.format(tutorial, tutorial, temp.strip())
		action_string += new_action

		new_action = action_do_tutorial

		temp = ''
		for item in tutorials[tutorial]['Concepts'].strip().split(','):
			if item.strip() != 'None':
				temp += '(has_concept ?s {})\n'.format(item.strip())

		new_action = new_action.format(tutorial, temp.strip(), tutorial_cost)
		action_string += new_action


	for activity in activities.keys():

		new_action = action_do_activity

		temp = ''
		for item in activities[activity]['Concepts'].strip().split(','):
			if item.strip() != 'None':
				temp += '(apply {} {})\n'.format(item.strip(), activity)

		new_action = new_action.format(activity, activity, activity, temp.strip(), student_ID)
		action_string += new_action

		new_action = action_done_activity

		temp1 = ''
		for item in activities[activity]['Concepts'].strip().split(','):
			if item.strip() != 'None':
				temp1 += '(applied {} {})\n'.format(item.strip(), activity)

		temp2 = ''
		for item in activities[activity]['Concepts'].strip().split(','):
			if item.strip() != 'None':
				temp2 += '(not (applied {} {}))\n'.format(item.strip(), activity)
				temp2 += '(used_concept ?s {})\n'.format(item.strip())

		new_action = new_action.format(activity, activity, temp1.strip(), activity, activity, temp2.strip())

		action_string += new_action

	with open('domain-fwd.pddl', 'w') as template:
		template.write(domain_template.format(action_string))

	print 'Done.'


'''
method :: main
'''
def main():

    parser = argparse.ArgumentParser(description='''Compile planning files from DB.''', epilog="Usage >> ./compile_domains.py -u fwd -d 1 -s")

    parser.add_argument('-u', '--user',        type=str,             help="Select fwd versus mrp modes.")
    parser.add_argument('-s', '--student',     action='store_true',  help="Include students in curriculum?")
    parser.add_argument('-d', '--difficulty',  type=int,             help="Select Difficulty of curriculum; Beginner =  1, Intermediate = 2, Advanced = 3.")

    if not sys.argv[1:] or '-h' in sys.argv[1:]:
        print parser.print_help()
        sys.exit(1)

    args = parser.parse_args()

    if args.user == 'fwd':
    	write_fwd_files()
    else:
		write_act_files()


if __name__ == "__main__":
	main()
	   
