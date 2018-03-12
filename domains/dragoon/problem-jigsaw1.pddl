(define (problem class1)
(:domain dragoon-class)

(:objects 
linear exponential extended_exponential capacity epidemic interaction - schema
t1 t2 t3 t4 t5 t6 - tutorial 
rabbit isle1 isle2 isle3 isle4 isle5 isle6 epic - assignment
s1 s2 - student
)

(:init
(contains_schema t1 linear)
(contains_schema t2 exponential)
(contains_schema t3 extended_exponential)
(contains_schema t4 capacity)
(contains_schema t5 epidemic)
(contains_schema t6 interaction)
(contains_schema rabbit exponential)
(contains_schema isle1 linear)
(contains_schema isle2 exponential)
(contains_schema isle3 exponential)
(contains_schema isle4 exponential)
(contains_schema isle4 extended_exponential)
(contains_schema isle4 capacity)
(contains_schema isle5 exponential)
(contains_schema isle5 extended_exponential)
(contains_schema isle5 capacity)
(contains_schema isle6 exponential)
(contains_schema isle6 capacity)
(contains_schema isle6 interaction)
(contains_schema epic epidemic)
)

(:goal
(and
(applied_schema s1 linear)
(applied_schema s1 exponential)
(applied_schema s1 extended_exponential)
(applied_schema s1 capacity)
(applied_schema s1 epidemic)
(applied_schema s1 interaction)
(applied_schema s2 linear)
(applied_schema s2 exponential)
(applied_schema s2 extended_exponential)
(applied_schema s2 capacity)
(applied_schema s2 epidemic)
(applied_schema s2 interaction)
)
)

)
