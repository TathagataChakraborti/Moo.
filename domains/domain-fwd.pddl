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

(:action set_concepts_T8
:parameters (?s - student)
:precondition (and
(done ?s T8)
)
:effect (and
(has_concept ?s functions)
(has_concept ?s action-costs)
(increase (total-cost) 0)
)
)

(:action do_tutorial_T8
:parameters (?s - student)
:precondition (and)
:effect (and
(has_concept ?s functions)
(has_concept ?s action-costs)
(increase (total-cost) 9)
)
)

(:action set_concepts_T9
:parameters (?s - student)
:precondition (and
(done ?s T9)
)
:effect (and
(has_concept ?s adl)
(increase (total-cost) 0)
)
)

(:action do_tutorial_T9
:parameters (?s - student)
:precondition (and)
:effect (and
(has_concept ?s adl)
(increase (total-cost) 9)
)
)

(:action set_concepts_T6
:parameters (?s - student)
:precondition (and
(done ?s T6)
)
:effect (and
(has_concept ?s typing)
(increase (total-cost) 0)
)
)

(:action do_tutorial_T6
:parameters (?s - student)
:precondition (and)
:effect (and
(has_concept ?s typing)
(increase (total-cost) 9)
)
)

(:action set_concepts_T7
:parameters (?s - student)
:precondition (and
(done ?s T7)
)
:effect (and
(has_concept ?s equality)
(increase (total-cost) 0)
)
)

(:action do_tutorial_T7
:parameters (?s - student)
:precondition (and)
:effect (and
(has_concept ?s equality)
(increase (total-cost) 9)
)
)

(:action set_concepts_T4
:parameters (?s - student)
:precondition (and
(done ?s T4)
)
:effect (and
(has_concept ?s negative-conditions)
(increase (total-cost) 0)
)
)

(:action do_tutorial_T4
:parameters (?s - student)
:precondition (and)
:effect (and
(has_concept ?s negative-conditions)
(increase (total-cost) 9)
)
)

(:action set_concepts_T5
:parameters (?s - student)
:precondition (and
(done ?s T5)
)
:effect (and
(has_concept ?s action-costs)
(increase (total-cost) 0)
)
)

(:action do_tutorial_T5
:parameters (?s - student)
:precondition (and)
:effect (and
(has_concept ?s action-costs)
(increase (total-cost) 9)
)
)

(:action set_concepts_T2
:parameters (?s - student)
:precondition (and
(done ?s T2)
)
:effect (and
(has_concept ?s operators)
(increase (total-cost) 0)
)
)

(:action do_tutorial_T2
:parameters (?s - student)
:precondition (and)
:effect (and
(has_concept ?s operators)
(increase (total-cost) 9)
)
)

(:action set_concepts_T3
:parameters (?s - student)
:precondition (and
(done ?s T3)
)
:effect (and
(has_concept ?s states)
(increase (total-cost) 0)
)
)

(:action do_tutorial_T3
:parameters (?s - student)
:precondition (and)
:effect (and
(has_concept ?s states)
(increase (total-cost) 9)
)
)

(:action set_concepts_T0
:parameters (?s - student)
:precondition (and
(done ?s T0)
)
:effect (and
(has_concept ?s strips)
(increase (total-cost) 0)
)
)

(:action do_tutorial_T0
:parameters (?s - student)
:precondition (and)
:effect (and
(has_concept ?s strips)
(increase (total-cost) 9)
)
)

(:action set_concepts_T1
:parameters (?s - student)
:precondition (and
(done ?s T1)
)
:effect (and
(has_concept ?s propositions)
(increase (total-cost) 0)
)
)

(:action do_tutorial_T1
:parameters (?s - student)
:precondition (and)
:effect (and
(has_concept ?s propositions)
(increase (total-cost) 9)
)
)

(:action set_concepts_T10
:parameters (?s - student)
:precondition (and
(done ?s T10)
)
:effect (and
(has_concept ?s conditional-effects)
(increase (total-cost) 0)
)
)

(:action do_tutorial_T10
:parameters (?s - student)
:precondition (and)
:effect (and
(has_concept ?s conditional-effects)
(increase (total-cost) 9)
)
)

(:action set_concepts_T11
:parameters (?s - student)
:precondition (and
(done ?s T11)
)
:effect (and
(has_concept ?s domain-axioms)
(increase (total-cost) 0)
)
)

(:action do_tutorial_T11
:parameters (?s - student)
:precondition (and)
:effect (and
(has_concept ?s domain-axioms)
(increase (total-cost) 9)
)
)

(:action set_concepts_T12
:parameters (?s - student)
:precondition (and
(done ?s T12)
)
:effect (and
(has_concept ?s temporal-constraints)
(increase (total-cost) 0)
)
)

(:action do_tutorial_T12
:parameters (?s - student)
:precondition (and)
:effect (and
(has_concept ?s temporal-constraints)
(increase (total-cost) 9)
)
)

(:action do_activity_A1
:parameters (?s - student)
:precondition (and
(not (lock ?s))
(not (done ?s A1))
)
:effect (and
(lock ?s)
(todo A1 ?s)
(apply functions A1)
(apply negative-conditions A1)
(apply equality A1)
(need_contribution S5)
(increase (total-cost) 1)
)
)

(:action done_activity_A1
:parameters (?s - student)
:precondition (and
(todo A1 ?s)
(applied functions A1)
(applied negative-conditions A1)
(applied equality A1)
)
:effect (and
(not (lock ?s))
(not (todo A1 ?s))
(done ?s A1)
(not (applied functions A1))
(used_concept ?s functions)
(not (applied negative-conditions A1))
(used_concept ?s negative-conditions)
(not (applied equality A1))
(used_concept ?s equality)
(increase (total-cost) 0)
)
)

(:action do_activity_A0
:parameters (?s - student)
:precondition (and
(not (lock ?s))
(not (done ?s A0))
)
:effect (and
(lock ?s)
(todo A0 ?s)
(apply strips A0)
(apply propositions A0)
(apply operators A0)
(apply states A0)
(apply action-costs A0)
(apply typing A0)
(need_contribution S5)
(increase (total-cost) 1)
)
)

(:action done_activity_A0
:parameters (?s - student)
:precondition (and
(todo A0 ?s)
(applied strips A0)
(applied propositions A0)
(applied operators A0)
(applied states A0)
(applied action-costs A0)
(applied typing A0)
)
:effect (and
(not (lock ?s))
(not (todo A0 ?s))
(done ?s A0)
(not (applied strips A0))
(used_concept ?s strips)
(not (applied propositions A0))
(used_concept ?s propositions)
(not (applied operators A0))
(used_concept ?s operators)
(not (applied states A0))
(used_concept ?s states)
(not (applied action-costs A0))
(used_concept ?s action-costs)
(not (applied typing A0))
(used_concept ?s typing)
(increase (total-cost) 0)
)
)

(:action do_activity_A3
:parameters (?s - student)
:precondition (and
(not (lock ?s))
(not (done ?s A3))
)
:effect (and
(lock ?s)
(todo A3 ?s)
(apply adl A3)
(apply domain-axioms A3)
(apply conditional-effects A3)
(need_contribution S5)
(increase (total-cost) 1)
)
)

(:action done_activity_A3
:parameters (?s - student)
:precondition (and
(todo A3 ?s)
(applied adl A3)
(applied domain-axioms A3)
(applied conditional-effects A3)
)
:effect (and
(not (lock ?s))
(not (todo A3 ?s))
(done ?s A3)
(not (applied adl A3))
(used_concept ?s adl)
(not (applied domain-axioms A3))
(used_concept ?s domain-axioms)
(not (applied conditional-effects A3))
(used_concept ?s conditional-effects)
(increase (total-cost) 0)
)
)

(:action do_activity_A2
:parameters (?s - student)
:precondition (and
(not (lock ?s))
(not (done ?s A2))
)
:effect (and
(lock ?s)
(todo A2 ?s)
(apply adl A2)
(apply conditional-effects A2)
(need_contribution S5)
(increase (total-cost) 1)
)
)

(:action done_activity_A2
:parameters (?s - student)
:precondition (and
(todo A2 ?s)
(applied adl A2)
(applied conditional-effects A2)
)
:effect (and
(not (lock ?s))
(not (todo A2 ?s))
(done ?s A2)
(not (applied adl A2))
(used_concept ?s adl)
(not (applied conditional-effects A2))
(used_concept ?s conditional-effects)
(increase (total-cost) 0)
)
)

(:action do_activity_A5
:parameters (?s - student)
:precondition (and
(not (lock ?s))
(not (done ?s A5))
)
:effect (and
(lock ?s)
(todo A5 ?s)
(apply temporal-constraints A5)
(need_contribution S5)
(increase (total-cost) 1)
)
)

(:action done_activity_A5
:parameters (?s - student)
:precondition (and
(todo A5 ?s)
(applied temporal-constraints A5)
)
:effect (and
(not (lock ?s))
(not (todo A5 ?s))
(done ?s A5)
(not (applied temporal-constraints A5))
(used_concept ?s temporal-constraints)
(increase (total-cost) 0)
)
)

(:action do_activity_A4
:parameters (?s - student)
:precondition (and
(not (lock ?s))
(not (done ?s A4))
)
:effect (and
(lock ?s)
(todo A4 ?s)
(apply conditional-effects A4)
(need_contribution S5)
(increase (total-cost) 1)
)
)

(:action done_activity_A4
:parameters (?s - student)
:precondition (and
(todo A4 ?s)
(applied conditional-effects A4)
)
:effect (and
(not (lock ?s))
(not (todo A4 ?s))
(done ?s A4)
(not (applied conditional-effects A4))
(used_concept ?s conditional-effects)
(increase (total-cost) 0)
)
)



)
