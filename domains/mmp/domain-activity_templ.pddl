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
(applied_schema ?s - student ?a - assignment ?c - schema)
(done ?s - student ?q - content)
(completed_assignment_one ?s - student ?a - assignment ?c - schema)
(completed_assignment_two ?s - student ?a - assignment ?c1 ?c2 - schema)
(completed_assignment_three ?s - student ?a - assignment ?c1 ?c2 ?c3 - schema)
(completed_assignment_four ?s - student ?a - assignment ?c1 ?c2 ?c3 ?c4 - schema)
)

%OPERATORS%

)
