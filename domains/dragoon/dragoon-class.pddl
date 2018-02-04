(define (domain dragoon-class)
(:requirements :strips :typing)

(:types
student concept content - object
assignment tutorial - content
)

(:predicates
(contains_concept ?q - content ?c - concept)
(has_concept ?s - student ?c - concept)
(applied_concept ?s - student ?c - concept)
(done ?s - student ?q - content)
)

(:action complete_tutorial
    :parameters (?s - student ?t - tutorial ?c - concept)
    :precondition (and (contains_concept ?t ?c) (not (done ?s ?t)))
    :effect (and (has_concept ?s ?c) (done ?s ?t))
)

(:action complete_assignment
    :parameters (?s - student ?a - assignment ?c - concept)
    :precondition (and (contains_concept ?a ?c) (has_concept ?s ?c) (not (done ?s ?a)))
    :effect (and (applied_concept ?s ?c) (done ?s ?a))
)

(:action complete_assignment_together
    :parameters (?s1 ?s2 - student ?a - assignment ?c - concept)
    :precondition (and  (contains_concept ?a ?c)
                        (has_concept ?s1 ?c)
                        (not (has_concept ?s2 ?c))
                        (not (done ?s1 ?a))
                        (not (done ?s2 ?a)))
    :effect (and (applied_concept ?s1 ?c)
            (has_concept ?s2 ?c)
            (done ?s1 ?a)
            (done ?s2 ?a))
)

)