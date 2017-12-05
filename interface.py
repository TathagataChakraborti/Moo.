import subprocess
import re

def plan(domain):
	command = 'python fd/fast-downward.py fd/misc/tests/benchmarks/gripper/prob01.pddl --translate-options --full-encoding --search-options --search astar(ff())'
	command = command.split()
	pattern = re.compile('\(\\d+\)')
	sol = []
	for line in _run(command):
		match = pattern.search(line)
		if match and match.end() == len(line) - 1:
			sol.append(line)
	return sol

def explain(domain):
	#	command = 
	return None

def _run(command):
	output = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
	return iter(output.stdout.readline, b'')

#if __name__ == '__main__':
#	print(''.join(plan("")))
