(define (problem prob-curriculum)
(:domain curriculum)

(:objects 
S5 - student
functions strips equality temporal-constraints propositions operators action-costs states conditional-effects negative-conditions typing adl domain-axioms - concept
T8 T9 T6 T7 T4 T5 T2 T3 T0 T1 T10 T11 T12 - tutorial
A1 A0 A3 A2 A5 A4 - activity
)

(:init 

(= (total-cost) 0)
)

(:goal
(and
(not (lock S5))
(used_concept S5 temporal-constraints)
(used_concept S5 operators)
(used_concept S5 negative-conditions)
(used_concept S5 adl)
)
)

(:metric minimize (total-cost))

)
