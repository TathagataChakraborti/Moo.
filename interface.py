import subprocess
import re

def plan(domain, problem):
	command = 'python fd/fast-downward.py '+ domain + ' ' + problem +' --search-options --search astar(ff())'
	print command
	command = command.split()
	pattern = re.compile('\(\\d+\)')
	sol = []
	for line in _run(command):
		match = pattern.search(line)
		if match and match.end() == len(line) - 1:
			sol.append(line)
	return sol

def explain(alpha):
	command = "python exp/src/Explainer.py -s EE -m domains/activity/domain-activity.pddl -n domains/activity/domain-human-activity.pddl -t domains/activity/domain-activity_templ.pddl -p domains/activity/problem-activity.pddl -r domains/activity/problem_template.pddl -q domains/activity/problem-human-activity.pddl -a " + alpha
	#print command
	command = command.split()
	sol = []
	for line in _run(command):
		sol.append(line)
	print sol
	command = "cat exp.dat"
	command = command.split()
	sol = []
	for line in _run(command):
		sol.append(line)

	return sol

def _run(command):
	output = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
	return iter(output.stdout.readline, b'')

#if __name__ == '__main__':
#	print(''.join(explain("1")))
