(define (problem class1)
(:domain dragoon-class-curriculum)

(:objects 
linear_growth - linear
exponential_growth exponential_decay - exponential
ee_growth - extended_exponential
carrying_capacity - capacity
flu - epidemic
predator_prey - interaction
t1 t2 t3 t4 t5 t6 t7 - tutorial 
rabbit isle1 isle2 epic - one_schema
isle3 isle5 - two_schema
isle6 - three_schema
isle4 - four_schema
s1 - student
)

(:init
(contains_schema t1 linear_growth)
(contains_schema t2 exponential_growth)
(contains_schema t3 exponential_decay)
(contains_schema t4 ee_growth)
(contains_schema t5 carrying_capacity)
(contains_schema t6 flu)
(contains_schema t7 predator_prey)
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
(contains_schema isle5 exponential_decay)
(contains_schema isle6 exponential_growth)
(contains_schema isle6 carrying_capacity)
(contains_schema isle6 predator_prey)
(contains_schema epic flu)
;; learner model initial conditions
(has_schema s1 linear_growth)
(has_schema s1 exponential_growth)
(has_schema s1 exponential_decay)
(has_schema s1 ee_growth)
(has_schema s1 carrying_capacity)
(has_schema s1 predator_prey)
)

(:goal
(and
(done s1 isle1)
(done s1 isle2)
(done s1 isle3)
(done s1 isle4)
(done s1 isle5)
(done s1 isle6)
(completed_assignment_one s1 isle1 linear_growth)
(completed_assignment_one s1 isle2 exponential_growth)
(completed_assignment_two s1 isle3 exponential_growth exponential_decay)
(completed_assignment_two s1 isle5 exponential_growth exponential_decay)
(completed_assignment_four s1 isle4 exponential_growth exponential_decay ee_growth carrying_capacity)
(completed_assignment_three s1 isle6 exponential_growth carrying_capacity predator_prey)

)
)

)
