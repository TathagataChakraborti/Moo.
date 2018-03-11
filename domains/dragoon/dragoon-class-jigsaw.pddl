(define (domain dragoon-class)
(:requirements :strips :typing)

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

(:action complete_assignment
	:parameters (?s - student ?a - assignment ?c - schema)
	:precondition (and (contains_schema ?a ?c) (has_schema ?s ?c) (not (done ?s ?a)))
	:effect (and (applied_schema ?s ?c) (done ?s ?a))
)

(:action complete_assignment_together
	:parameters (?s1 ?s2 - student ?a - assignment ?c - schema)
	:precondition (and  (contains_schema ?a ?c)
						(has_schema ?s1 ?c)
						(not (has_schema ?s2 ?c))
						(not (done ?s1 ?a))
						(not (done ?s2 ?a)))
	:effect (and (applied_schema ?s1 ?c)
			(has_schema ?s2 ?c)
			(done ?s1 ?a)
			(done ?s2 ?a))
)

(:action complete_assignment_together_three
	:parameters (?s1 ?s2 ?s3 - student ?a - assignment ?c - schema)
	:precondition (and  (contains_schema ?a ?c)
						(has_schema ?s1 ?c)
						(not (has_schema ?s2 ?c))
						(not (has_schema ?s3 ?c))
						(not (done ?s1 ?a))
						(not (done ?s2 ?a))
						(not (done ?s3 ?a)))
	:effect (and (applied_schema ?s1 ?c)
			(has_schema ?s2 ?c)
			(has_schema ?s3 ?c)
			(done ?s1 ?a)
			(done ?s2 ?a)
			(done ?s3 ?a))
)

(:action complete_assignment_together_four
	:parameters (?s1 ?s2 ?s3 ?s4- student ?a - assignment ?c - schema)
	:precondition (and  (contains_schema ?a ?c)
						(has_schema ?s1 ?c)
						(not (has_schema ?s2 ?c))
						(not (has_schema ?s3 ?c))
						(not (has_schema ?s4 ?c))
						(not (done ?s1 ?a))
						(not (done ?s2 ?a))
						(not (done ?s3 ?a))
						(not (done ?s4 ?a)))
	:effect (and (applied_schema ?s1 ?c)
			(has_schema ?s2 ?c)
			(has_schema ?s3 ?c)
			(has_schema ?s4 ?c)
			(done ?s1 ?a)
			(done ?s2 ?a)
			(done ?s3 ?a)
			(done ?s4 ?a))
)

(:action complete_assignment_together_five
	:parameters (?s1 ?s2 ?s3 ?s4 ?s5 - student ?a - assignment ?c - schema)
	:precondition (and  (contains_schema ?a ?c)
						(has_schema ?s1 ?c)
						(not (has_schema ?s2 ?c))
						(not (has_schema ?s3 ?c))
						(not (has_schema ?s4 ?c))
						(not (has_schema ?s5 ?c))
						(not (done ?s1 ?a))
						(not (done ?s2 ?a))
						(not (done ?s3 ?a))
						(not (done ?s4 ?a))
						(not (done ?s5 ?a)))
	:effect (and (applied_schema ?s1 ?c)
			(has_schema ?s2 ?c)
			(has_schema ?s3 ?c)
			(has_schema ?s4 ?c)
			(has_schema ?s5 ?c)
			(done ?s1 ?a)
			(done ?s2 ?a)
			(done ?s3 ?a)
			(done ?s4 ?a))
)

)

