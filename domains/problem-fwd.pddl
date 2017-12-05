(define (problem prob1)
(:domain curriculum)

(:objects 
s1 s2 - student
c1 c2 - concept
t1 t2 - tutorial
a1 a2 - activity
)

(:init 
(has_concept s2 c2)
(= (total-cost) 0)
)

(:goal
(and
;(has_concept s1 c1)
;(has_concept s1 c2)
(used_concept s1 c1)
(used_concept s1 c2)
(not (lock s1))
(not (lock s2))
)
)

(:metric minimize (total-cost))

)
