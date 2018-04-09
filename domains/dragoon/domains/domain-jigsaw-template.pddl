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

{}

)