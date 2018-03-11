(define (problem class1)
(:domain dragoon-class-curriculum)

(:objects 
linear_growth - linear
exponential_growth exponential_decay - exponential
ee_growth - extended_exponential
carrying_capacity - capacity
flu - epidemic
predator_prey - interaction
t1 t2 t3 t4 t5 t6 - tutorial 
rabbit isle1 isle2 isle5 epic - one_schema
isle3 - two_schema
isle6 - three_schema
isle4 - four_schema
s1 - student
)

(:init
(contains_schema t1 linear_growth)
(contains_schema t2 exponential)
(contains_schema t3 extended_exponential)
(contains_schema t4 capacity)
(contains_schema t5 epidemic)
(contains_schema t6 interaction)
(contains_schema rabbit exponential_growth)
(contains_schema isle1 linear_growth)
(contains_schema isle2 exponential_growth)
(contains_schema isle3 exponential_growth)
(contains_schema isle3 exponential_decay)
(contains_schema isle4 exponential_growth)
(contains_schema isle4 exponential_decay)
(contains_schema isle4 ee_growth)
(contains_schema isle4 carrying_capacity)
(contains_schema isle5 exponential_growth)
(contains_schema isle6 exponential)
(contains_schema isle6 carrying_capacity)
(contains_schema isle6 predator_prey)
(contains_schema epic flu)
;(is_dependent linear exponential)
;(is_dependent init linear)
;(is_dependent exponential extended_exponential)
;(is_dependent exponential capacity)
;(is_dependent extended_exponential epidemic)
;(is_dependent exponential interaction)
;(applied_schema s1 init)
)

(:goal
(and
(done s1 isle6)
;(applied_schema s1 exponential)

)
)

)
