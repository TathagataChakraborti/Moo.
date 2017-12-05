(define (problem prob-curriculum)
(:domain curriculum)

(:objects 
S3 S2 S1 S5 S4 - student
functions strips equality temporal-constraints propositions operators action-costs states conditional-effects negative-conditions typing adl domain-axioms - concept
T8 T9 T6 T7 T4 T5 T2 T3 T0 T1 T10 T11 T12 - tutorial
A1 A0 A3 A2 A5 A4 - activity
)

(:init 
(done S3 T0)
(done S3 T1)
(done S3 T2)
(done S3 T3)
(done S3 T4)
(done S3 T5)
(done S3 A0)
(done S3 A1)
(done S2 T0)
(done S2 T1)
(done S2 A0)
(done S4 T0)
(done S4 T1)
(done S4 T2)
(= (total-cost) 0)
)

(:goal
(and
(not (lock S3))
(not (lock S2))
(not (lock S1))
(not (lock S5))
(not (lock S4))
(used_concept S5 functions)
(used_concept S5 strips)
(used_concept S5 equality)
(used_concept S5 temporal-constraints)
(used_concept S5 propositions)
(used_concept S5 operators)
(used_concept S5 action-costs)
(used_concept S5 states)
(used_concept S5 conditional-effects)
(used_concept S5 negative-conditions)
(used_concept S5 typing)
(used_concept S5 adl)
(used_concept S5 domain-axioms)
)
)

(:metric minimize (total-cost))

)
