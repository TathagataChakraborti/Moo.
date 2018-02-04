(define (problem class2)
(:domain dragoon-class)

(:objects 
linear exponential extended_exponential capacity epidemic interaction - concept
t1 t2 t3 t4 t5 t6 - tutorial 
rabbit isle1 isle2 isle3 isle4 isle5 isle6 epic - assignment
s1 s2 s3 - student
)

(:init
(contains_concept t1 linear)
(contains_concept t2 exponential)
(contains_concept t3 extended_exponential)
(contains_concept t4 capacity)
(contains_concept t5 epidemic)
(contains_concept t6 interaction)
(contains_concept rabbit linear)
(contains_concept isle1 linear)
(contains_concept isle2 exponential)
(contains_concept isle3 exponential)
(contains_concept isle4 exponential)
(contains_concept isle4 extended_exponential)
(contains_concept isle4 capacity)
(contains_concept isle5 exponential)
(contains_concept isle5 extended_exponential)
(contains_concept isle5 capacity)
(contains_concept isle6 exponential)
(contains_concept isle6 capacity)
(contains_concept isle6 interaction)
(contains_concept epic epidemic)
(applied_concept s2 linear)
(applied_concept s2 exponential)

)

(:goal
(and
(applied_concept s1 linear)
(applied_concept s1 exponential)
(applied_concept s1 extended_exponential)
(applied_concept s1 capacity)
(applied_concept s1 interaction)
;(applied_concept s2 linear)
;(applied_concept s2 exponential)
(applied_concept s2 extended_exponential)
(applied_concept s2 capacity)
(applied_concept s2 interaction)
(applied_concept s3 linear)
(applied_concept s3 exponential)
(applied_concept s3 extended_exponential)
(applied_concept s3 capacity)
(applied_concept s3 interaction)
)
)

)