from random import random
from math import ceil, floor


class GenerateJigsaw:
	path = "dragoon/domains/"
	studentID = "S"
	tutorialID = "T"
	assignmentID = "A"
	conceptID = "C"

	students = []
	tutorials = {} # key is tutorial ID, value the concept that it teaches
	concepts = {} # key is concept ID, value is an array, which has concepts that it depends on
	assignments = {} # key is assignment ID, and value is an array of the concepts that each assignment teaches
	actionAlone = "\n(:action complete_assignment_{}\n\t:parameters(?s - student)\n\t:precondition (and \n\t\t\t\t\t{}\n\t\t\t\t)\n\t:effect (and {})\n)"
	actionTogether = "\n(:action complete_assignment_together_{}\n\t:parameters(?s ?s1 - student)\n\t:precondition (and \n\t\t\t\t\t{}\n\t\t\t\t)\n\t:effect (and {})\n)"
	containsSchema = "(contains_schema {} {})" # assignment schema
	hasSchema = "(has_schema {} {})" # student, schema
	appliedSchema = "(applied_schema {} {})" # student, schema
	doneAssignment = "(done {} {})" # student, assignment
	notOperator = "(not {})"
	preconditionJoin = "\n\t\t\t\t\t"
	firstStudent = "?s"
	secondStudent = "?s1"
	
	def __init__(self):
		print "Generator created"

	def generate_data(self):
		self.write_domain_file()
		self.write_problem_file()
	
	# have to write the actions in this
	def write_domain_file(self):
		actionString = ""
		print "Writing domain file ..."
		print GenerateJigsaw.concepts
		for key in GenerateJigsaw.assignments.keys():
			assignment = GenerateJigsaw.assignments[key]
			actions = self.write_action(key, assignment)
			actionString += ' '.join(actions)

		with open(GenerateJigsaw.path + "domain-jigsaw-template.pddl", 'r') as template:
			domain_template = template.read()

		temp = domain_template.format(actionString)

		with open(GenerateJigsaw.path + "domain-jigsaw.pddl", 'w') as f:
			f.write(temp)

	def write_problem_file(self):
		print "Writing Problem File ..."
		with open(GenerateJigsaw.path + "problem-jigsaw-template.pddl", 'r') as template:
			problem_template = template.read()

		problem_template = problem_template.replace('{S}', ' '.join(GenerateJigsaw.students))
		problem_template = problem_template.replace('{T}', ' '.join(GenerateJigsaw.tutorials.keys()))
		problem_template = problem_template.replace('{C}', ' '.join(GenerateJigsaw.concepts.keys()))
		problem_template = problem_template.replace('{A}', ' '.join(GenerateJigsaw.assignments.keys()))

		initialState = [GenerateJigsaw.containsSchema.format(name, concept) for name in GenerateJigsaw.assignments.keys() for concept in GenerateJigsaw.assignments[name]]
		for tutorial in GenerateJigsaw.tutorials.keys():
			initialState.append(GenerateJigsaw.containsSchema.format(tutorial, GenerateJigsaw.tutorials[tutorial]))
		goalState = [GenerateJigsaw.appliedSchema.format(studentID, concept) for studentID in GenerateJigsaw.students for concept in GenerateJigsaw.concepts.keys()]

		problem_template = problem_template.replace('{I}', '\n'.join(initialState))
		problem_template = problem_template.replace('{G}', '\n'.join(goalState))

		with open(GenerateJigsaw.path + 'problem-jigsaw.pddl', 'w') as f:
			f.write(problem_template)


	def write_action(self, name, concepts):
		parentConcepts = set()
		for concept in concepts:
			if len(GenerateJigsaw.concepts[concept]) > 0:
				parentConcepts.update(GenerateJigsaw.concepts[concept])
		actions = []
		preconditions = []
		effects = []
		containsSchema = []
		parentSchemas = []
		# single student action
		action = GenerateJigsaw.actionAlone
		for concept in concepts:
			containsSchema.append(GenerateJigsaw.containsSchema.format(name, concept))
			preconditions.append(GenerateJigsaw.hasSchema.format(GenerateJigsaw.firstStudent, concept))
			#preconditions.append(GenerateJigsaw.notOperator.format(GenerateJigsaw.appliedSchema.format(GenerateJigsaw.firstStudent, concept)))
			effects.append(GenerateJigsaw.appliedSchema.format(GenerateJigsaw.firstStudent, concept))
		effects.append(GenerateJigsaw.doneAssignment.format(GenerateJigsaw.firstStudent, name))
			#preconditionsDouble.append(GenerateJigsaw
		for concept in parentConcepts:
			parentSchemas.append(GenerateJigsaw.appliedSchema.format(GenerateJigsaw.firstStudent, concept))
			#preconditionsDouble.append(GenerateJigsaw.appliedSchema.format(GenerateJigsaw.secondStudent, concept))
		preconditions = preconditions + containsSchema + parentSchemas
		actions.append(action.format(name, GenerateJigsaw.preconditionJoin.join(preconditions), ' '.join(effects)))

		# group actions
		# appending the pre-required comcept completion
		# first concept is always brought on the table by first student
		# globally adding the not hasSchema for the second student
		effects = list()
		effects.append(GenerateJigsaw.doneAssignment.format(GenerateJigsaw.firstStudent, name))
		effects.append(GenerateJigsaw.doneAssignment.format(GenerateJigsaw.secondStudent, name))
		effects.append(GenerateJigsaw.appliedSchema.format(GenerateJigsaw.firstStudent, concepts[0]))
		effects.append(GenerateJigsaw.hasSchema.format(GenerateJigsaw.secondStudent, concepts[0]))

		preconditions = list(containsSchema + parentSchemas + GenerateJigsaw.get_preconditions(1, concepts[0]))

		for concept in parentConcepts:
			preconditions.append(GenerateJigsaw.appliedSchema.format(GenerateJigsaw.secondStudent, concept))

		preconditionsDouble = [[]]
		effectsDouble = [[]]
		numberOfConcepts = len(concepts)

		if numberOfConcepts == 1:
			preconditionsDouble[0] = list(preconditions)
			#preconditionsDouble[0].append(GenerateJigsaw.notOperator.format(GenerateJigsaw.appliedSchema.format(GenerateJigsaw.secondStudent, concepts[0])))
			effectsDouble[0]  = list(effects)

		# each of them is for the action
		for i in range(1, numberOfConcepts, 1):
			# each of them for the precondition and effect
			pre = list(preconditions)
			eff = list(effects)
			for j in range(1, (numberOfConcepts/2)+1, 1):
				student = 1
				if j >= (numberOfConcepts - i):
					student = 2
				pre = pre + GenerateJigsaw.get_preconditions(student, concepts[j])
				eff = eff + GenerateJigsaw.get_effects(student, concepts[j])

			if i == 1:
				preconditionsDouble[i-1] = pre
				effectsDouble[i-1] = eff
			else:
				preconditionsDouble.append(pre)
				effectsDouble.append(eff)

		action = GenerateJigsaw.actionTogether
		for i in range(len(preconditionsDouble)):
			actions.append(action.format(name + "_" + str(i) ,GenerateJigsaw.preconditionJoin.join(preconditionsDouble[i]), ' '.join(effectsDouble[i])))

		return actions



	@staticmethod
	def get_preconditions(student, concept):
		if student == 2:
			student = GenerateJigsaw.secondStudent
			learningStudent = GenerateJigsaw.firstStudent
		else:
			student = GenerateJigsaw.firstStudent
			learningStudent = GenerateJigsaw.secondStudent

		conditions = []
		conditions.append(GenerateJigsaw.hasSchema.format(student, concept))
		#conditions.append(GenerateJigsaw.notOperator.format(GenerateJigsaw.appliedSchema.format(student, concept)))
		conditions.append(GenerateJigsaw.notOperator.format(GenerateJigsaw.hasSchema.format(learningStudent, concept)))
		
		return conditions

	@staticmethod
	def get_effects(student, concept):
		if student == 2:
			student = GenerateJigsaw.secondStudent
			learningStudent = GenerateJigsaw.firstStudent
		else:
			student = GenerateJigsaw.firstStudent
			learningStudent = GenerateJigsaw.secondStudent

		effects = []
		effects.append(GenerateJigsaw.appliedSchema.format(student, concept))
		effects.append(GenerateJigsaw.hasSchema.format(student,concept))

		return effects


class Generator:
	def __init__(self, fileName, students = 4, assignments = 10, random = True):
		self.random = random
		self.fileName = fileName
		self.students = students
		self.minAssignments = assignments
		self.parentConcepts = 4
		self.maxConceptsTaught = 4

		self.jigsaw = GenerateJigsaw()

	def set_parameters(self):
		self.assignments = int(random()*10 + self.minAssignments)
		self.assignments = 20
		self.concepts = int(self.assignments / 2)
		c2a = dict()

		for i in range(1, self.concepts+1):
			concept = GenerateJigsaw.conceptID + str(i)
			GenerateJigsaw.tutorials[GenerateJigsaw.tutorialID + str(i)] = GenerateJigsaw.conceptID + str(i)
			c2a[concept] = 0

			parentConcepts = 1
			if i > 3:
				parentConcepts = int(ceil(random()*self.parentConcepts))
				#parentConcepts = 0
			if i == 1:
				GenerateJigsaw.concepts[GenerateJigsaw.conceptID + '1'] = []
			elif i == 2:
				GenerateJigsaw.concepts[GenerateJigsaw.conceptID + '2'] = ['C1']
			else:
				parents = set()
				for j in range(0, min(parentConcepts, i)):
					index = int(ceil(random()*(i-1)))
					parents.add(GenerateJigsaw.conceptID + str(index))
				GenerateJigsaw.concepts[GenerateJigsaw.conceptID + str(i)] = list(parents)

		for i in range(1, self.students+1):
			GenerateJigsaw.students.append(GenerateJigsaw.studentID + str(i))

		for i in range(1, self.assignments+1):
			if i == 1:
				GenerateJigsaw.assignments[GenerateJigsaw.assignmentID + '1'] = ['C1']
			elif i == 2:
				GenerateJigsaw.assignments[GenerateJigsaw.assignmentID + '2'] = ['C2']
			else:
				# number of concepts that assignment will teach
				concepts = int(ceil(min(random()*self.maxConceptsTaught, i)))
				assignmentConcept = set()
				for j in range(0, concepts):
					# concept ID that it will teach
					ID = GenerateJigsaw.conceptID + str(int(ceil(random()*min(i, self.concepts))))
					if self.validate(assignmentConcept, ID):
						assignmentConcept.add(ID)
						c2a[ID] = c2a[ID]+1

				GenerateJigsaw.assignments[GenerateJigsaw.assignmentID + str(i)] = list(assignmentConcept)

		print c2a
		for concept in GenerateJigsaw.concepts.keys():
			while c2a[concept] < 2:
				assignmentID = GenerateJigsaw.assignmentID + str(int(ceil((random() +  1)*self.concepts)))
				assignment = GenerateJigsaw.assignments[assignmentID]
				if len(assignment) < self.maxConceptsTaught and self.validate(assignment, concept):
					assignment.append(concept)
					c2a[concept] = c2a[concept] + 1

		#Isle domain
		print GenerateJigsaw.assignments
		#GenerateJigsaw.assignments = {'isle1': ['linear_growth'], 'isle2': ['exponential_growth'], 'isle3': ['exponential_growth', 'exponential_decay'], 'isle4': ['exponential_growth', 'exponential_decay', 'ee_growth', 'carrying_capacity'], 'isle5': ['exponential_growth', 'exponential_decay'], 'isle6': ['exponential_growth', 'carrying_capacity', 'predator_prey'], 'rabbits': ['exponential_growth'], 'epic': ['flu']}
		#GenerateJigsaw.concepts = {'linear_growth': [], 'exponential_growth': ['linear_growth'], 'exponential_decay': ['linear_growth'], 'ee_growth': ['exponential_growth', 'exponential_decay'], 'predator_prey': ['exponential_growth', 'exponential_decay'], 'carrying_capacity': ['linear_growth'], 'flu': ['exponential_growth', 'exponential_decay', 'linear_growth']}
		#GenerateJigsaw.tutorials = {'T1': 'linear_growth', 'T2': 'exponential_growth', 'T3': 'exponential_decay', 'T4': 'ee_growth', 'T5': 'predator_prey', 'T6': 'carrying_capacity', 'T7': 'flu'}

	def validate(self, concepts, ID):
		for concept in concepts:
			if ID in GenerateJigsaw.concepts[concept]:
				return False

		for concept in GenerateJigsaw.concepts[ID]:
			if concept in concepts:
				return False

		return True
def main():
	g = Generator('')
	g.set_parameters()
	g.jigsaw.generate_data()

if __name__ == "__main__":
	main()
