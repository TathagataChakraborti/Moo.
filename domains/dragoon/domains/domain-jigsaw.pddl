(define (domain dragoon-class)
(:requirements :strips :typing :negative-preconditions)

(:types
student schema content - object
assignment tutorial - content
)

(:predicates
(contains_schema ?q - content ?c - schema)
(has_schema ?s - student ?c - schema)
(applied_schema ?s - student ?c - schema)
(done ?s - student ?q - content)
)

(:action complete_tutorial
    :parameters (?s - student ?t - tutorial ?c - schema)
    :precondition (and (contains_schema ?t ?c) (not (done ?s ?t)))
    :effect (and (has_schema ?s ?c) (done ?s ?t))
)


(:action complete_assignment_A1
	:parameters(?s - student)
	:precondition (and 
					(has_schema ?s C1)
					(not (applied_schema ?s C1))
					(contains_schema A1 C1)
				)
	:effect (and (applied_schema ?s C1) (done ?s A1))
) 
(:action complete_assignment_together_A1_0
	:parameters(?s ?s1 - student)
	:precondition (and 
					(contains_schema A1 C1)
					(has_schema ?s C1)
					(not (has_schema ?s1 C1))
				)
	:effect (and (done ?s A1) (done ?s1 A1) (applied_schema ?s C1) (has_schema ?s1 C1))
)
(:action complete_assignment_A3
	:parameters(?s - student)
	:precondition (and 
					(has_schema ?s C1)
					(not (applied_schema ?s C1))
					(contains_schema A3 C1)
				)
	:effect (and (applied_schema ?s C1) (done ?s A3))
) 
(:action complete_assignment_together_A3_0
	:parameters(?s ?s1 - student)
	:precondition (and 
					(contains_schema A3 C1)
					(has_schema ?s C1)
					(not (has_schema ?s1 C1))
				)
	:effect (and (done ?s A3) (done ?s1 A3) (applied_schema ?s C1) (has_schema ?s1 C1))
)
(:action complete_assignment_A2
	:parameters(?s - student)
	:precondition (and 
					(has_schema ?s C2)
					(not (applied_schema ?s C2))
					(contains_schema A2 C2)
					(applied_schema ?s C1)
				)
	:effect (and (applied_schema ?s C2) (done ?s A2))
) 
(:action complete_assignment_together_A2_0
	:parameters(?s ?s1 - student)
	:precondition (and 
					(contains_schema A2 C2)
					(applied_schema ?s C1)
					(has_schema ?s C2)
					(not (has_schema ?s1 C2))
					(applied_schema ?s1 C1)
				)
	:effect (and (done ?s A2) (done ?s1 A2) (applied_schema ?s C2) (has_schema ?s1 C2))
)
(:action complete_assignment_A5
	:parameters(?s - student)
	:precondition (and 
					(has_schema ?s C3)
					(not (applied_schema ?s C3))
					(has_schema ?s C1)
					(not (applied_schema ?s C1))
					(contains_schema A5 C3)
					(contains_schema A5 C1)
					(applied_schema ?s C2)
				)
	:effect (and (applied_schema ?s C3) (applied_schema ?s C1) (done ?s A5))
) 
(:action complete_assignment_together_A5_0
	:parameters(?s ?s1 - student)
	:precondition (and 
					(contains_schema A5 C3)
					(not (has_schema ?s1 C1))
					(contains_schema A5 C1)
					(has_schema ?s C3)
					(not (has_schema ?s1 C3))
					(applied_schema ?s1 C2)
					(applied_schema ?s C2)
					(has_schema ?s C1)
				)
	:effect (and (applied_schema ?s C1) (applied_schema ?s C3) (has_schema ?s C1) (done ?s A5) (done ?s1 A5))
) 
(:action complete_assignment_together_A5_1
	:parameters(?s ?s1 - student)
	:precondition (and 
					(contains_schema A5 C3)
					(not (has_schema ?s C1))
					(contains_schema A5 C1)
					(has_schema ?s1 C1)
					(has_schema ?s C3)
					(not (has_schema ?s1 C3))
					(applied_schema ?s1 C2)
					(applied_schema ?s C2)
				)
	:effect (and (applied_schema ?s1 C1) (applied_schema ?s C3) (has_schema ?s1 C1) (done ?s A5) (done ?s1 A5))
)
(:action complete_assignment_A4
	:parameters(?s - student)
	:precondition (and 
					(has_schema ?s C1)
					(not (applied_schema ?s C1))
					(contains_schema A4 C1)
				)
	:effect (and (applied_schema ?s C1) (done ?s A4))
) 
(:action complete_assignment_together_A4_0
	:parameters(?s ?s1 - student)
	:precondition (and 
					(contains_schema A4 C1)
					(has_schema ?s C1)
					(not (has_schema ?s1 C1))
				)
	:effect (and (done ?s A4) (done ?s1 A4) (applied_schema ?s C1) (has_schema ?s1 C1))
)
(:action complete_assignment_A6
	:parameters(?s - student)
	:precondition (and 
					(has_schema ?s C2)
					(not (applied_schema ?s C2))
					(contains_schema A6 C2)
					(applied_schema ?s C1)
				)
	:effect (and (applied_schema ?s C2) (done ?s A6))
) 
(:action complete_assignment_together_A6_0
	:parameters(?s ?s1 - student)
	:precondition (and 
					(contains_schema A6 C2)
					(applied_schema ?s C1)
					(has_schema ?s C2)
					(not (has_schema ?s1 C2))
					(applied_schema ?s1 C1)
				)
	:effect (and (done ?s A6) (done ?s1 A6) (applied_schema ?s C2) (has_schema ?s1 C2))
)

)