(define (domain curriculum)
(:requirements :strips :typing :conditional-effects)

(:types 
content concept student - object
activity tutorial - content
)

(:predicates
(transferred ?c - concept ?s1 ?s2 - student)
(has_concept ?s - student ?c - concept)
(used_concept ?s - student ?c - concept)
(apply ?c - concept ?a - activity)
(applied ?c - concept ?a - activity)
(done ?s - student ?a - content)
(todo ?a - activity ?s - student)
(lock ?s)
(need_contribution ?s)
)

(:functions
(total-cost)
)

(:action do_tutorial_t1
:parameters (?s - student)
:precondition (and)
:effect (and 
(has_concept ?s c1)
(increase (total-cost) 9)
)
)

(:action do_tutorial_t2
:parameters (?s - student)
:precondition (and)
:effect (and
(has_concept ?s c2)
(increase (total-cost) 9)
)
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

(:action do_activity_a1
:parameters (?s - student)
:precondition (and
(not (lock ?s))
(not (done ?s a1))
)
:effect (and 
(lock ?s)
(todo a1 ?s)
(apply c1 a1)
(apply c2 a1)
(need_contribution s1)
(increase (total-cost) 1)
)
)

(:action done_activity_a1
:parameters (?s - student)
:precondition (and
(todo a1 ?s)
(applied c1 a1)
(applied c2 a1)
)
:effect (and 
(not (lock ?s))
(not (todo a1 ?s))
(not (applied c1 a1))
(not (applied c2 a1))
(done ?s a1)
(has_concept ?s c1)
(has_concept ?s c2)
(increase (total-cost) 0)
)
)

(:action do_activity_a2
:parameters (?s - student)
:precondition (and
(not (done ?s a2))
(not (lock ?s))
)
:effect (and 
(lock ?s)
(todo a2 ?s)
(apply c1 a2)
(apply c2 a2)
(need_contribution s1)
(increase (total-cost) 1)
)
)

(:action done_activity_a2
:parameters (?s - student)
:precondition (and
(todo a2 ?s)
(applied c1 a2)
(applied c2 a2)
)
:effect (and 
(not (lock ?s))
(not (todo a2 ?s))
(not (applied c1 a2))
(not (applied c2 a2))
(done ?s a2)
(has_concept ?s c1)
(has_concept ?s c2)
(increase (total-cost) 0)
)
)

)


