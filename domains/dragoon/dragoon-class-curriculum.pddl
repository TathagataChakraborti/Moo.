(define (domain dragoon-class-curriculum)
(:requirements :strips :typing)

(:types
student schema content - object
assignment tutorial - content
one_schema two_schema three_schema four_schema - assignment
linear exponential extended_exponential capacity epidemic interaction - schema
)

(:predicates
(contains_schema ?q - content ?c - schema)
(has_schema ?s - student ?c - schema)
(applied_schema ?s - student ?c - schema)
(done ?s - student ?q - content)
(completed_assignment_one ?s - student ?a - assignment ?c - schema)
(completed_assignment_two ?s - student ?a - assignment ?c1 ?c2 - schema)
(completed_assignment_three ?s - student ?a - assignment ?c1 ?c2 ?c3 - schema)
(completed_assignment_four ?s - student ?a - assignment ?c1 ?c2 ?c3 ?c4 - schema)
)

(:action complete_tutorial
	:parameters (?s - student ?t - tutorial ?c - schema)
	:precondition (and (contains_schema ?t ?c) (not (done ?s ?t)))
	:effect (and
		(has_schema ?s ?c)
		(done ?s ?t)
	)
)

(:action apply_schema_linear
	:parameters (?s - student ?a - assignment ?c - linear)
	:precondition (and (contains_schema ?a ?c) (has_schema ?s ?c))
	:effect (and
			(applied_schema ?s ?c)
	)
)

(:action apply_schema_expoential
	:parameters (?s - student ?a - assignment ?c - exponential ?c1 - linear)
	:precondition (and (contains_schema ?a ?c) (applied_schema ?s ?c1) (has_schema ?s ?c))
	:effect (and
			(applied_schema ?s ?c)
	)
)

(:action apply_schema_extended_expoential
	:parameters (?s - student ?a - assignment ?c - extended_exponential ?c1 - exponential)
	:precondition (and (contains_schema ?a ?c) (applied_schema ?s ?c1) (has_schema ?s ?c))
	:effect (and
			(applied_schema ?s ?c)
	)
)

(:action apply_schema_epidemic
	:parameters (?s - student ?a - assignment ?c - epidemic ?c1 - extended_exponential)
	:precondition (and (contains_schema ?a ?c) (applied_schema ?s ?c1) (has_schema ?s ?c))
	:effect (and
			(applied_schema ?s ?c)
	)
)

(:action apply_schema_capacity
	:parameters (?s - student ?a - assignment ?c - capacity ?c1 - exponential)
	:precondition (and (contains_schema ?a ?c) (applied_schema ?s ?c1) (has_schema ?s ?c))
	:effect (and
			(applied_schema ?s ?c)
	)
)

(:action apply_schema_interaction
	:parameters (?s - student ?a - assignment ?c - interaction ?c1 - exponential)
	:precondition (and (contains_schema ?a ?c) (applied_schema ?s ?c1) (has_schema ?s ?c))
	:effect (and
			(applied_schema ?s ?c)
	)
)

(:action finish_assignment_one
	:parameters (?s - student ?a - one_schema ?c - schema)
	:precondition (and (contains_schema ?a ?c) (applied_schema ?s ?c) (not (done ?s ?a)))
	:effect (and
		(done ?s ?a)
		(completed_assignment_one ?s ?a ?c)
	)
)

(:action finish_assignment_two
	:parameters (?s - student ?a - two_schema ?c1 ?c2 ?c3 - schema)
	:precondition (and 
			(contains_schema ?a ?c1)
			(contains_schema ?a ?c2)
			(applied_schema ?s ?c1)
			(applied_schema ?s ?c2)
	)
	:effect (and
			(completed_assignment_two ?s ?a ?c1 ?c2)
			(done ?s ?a)
	)
)

(:action finish_assignment_three
	:parameters (?s - student ?a - three_schema ?c1 ?c2 ?c3 - schema)
	:precondition (and 
			(contains_schema ?a ?c1)
			(contains_schema ?a ?c2)
			(contains_schema ?a ?c3)
			(applied_schema ?s ?c1)
			(applied_schema ?s ?c2)
			(applied_schema ?s ?c3)
	)
	:effect (and
			(completed_assignment_three ?s ?a ?c1 ?c2 ?c3)
			(done ?s ?a)
	)
)

(:action finish_assignment_four
	:parameters (?s - student ?a - four_schema ?c1 ?c2 ?c3 ?c4 - schema)
	:precondition (and 
			(contains_schema ?a ?c1)
			(contains_schema ?a ?c2)
			(contains_schema ?a ?c3)
			(contains_schema ?a ?c4)
			(applied_schema ?s ?c1)
			(applied_schema ?s ?c2)
			(applied_schema ?s ?c3)
			(applied_schema ?s ?c4)
	)
	:effect (and
			(completed_assignment_four ?s ?a ?c1 ?c2 ?c3 ?c4)
			(done ?s ?a)
	)
)


)
