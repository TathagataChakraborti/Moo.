(define (domain curriculum)
(:requirements :strips :typing)

(:types 
content concept student - object
activity tutorial - content
)

(:predicates
(has_concept ?s - student ?c - concept)
(used_concept ?s - student ?c - concept)
(apply ?c - concept ?a - activity)
(applied ?c - concept ?a - activity)
(done ?s - student ?a - content)
(todo ?a - activity ?s - student)
(need_contribution ?s - student)
(lock ?s - student)
)

(:functions
(total-cost)
)

(:action apply
:parameters (?c - concept ?s - student ?a - activity)
:precondition (and
(apply ?c ?a)
(has_concept ?s ?c)
)
:effect (and
(not (apply ?c ?a))
(applied ?c ?a)
(used_concept ?s ?c)
(not (need_contribution ?s))
(increase (total-cost) 1)
)
)

{}

)
