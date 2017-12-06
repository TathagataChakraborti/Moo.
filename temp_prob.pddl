(define (problem prob1)
(:domain activity)

(:objects 
t1 t2 - typ
typing action-costs equality - req
a1 a2 a3 - name
)

(:init 
(has_concept typing)
(has_concept action-costs)
(has_concept equality)
)
 (:goal
  (and
(action_with_parameter a1 t1)
(action_with_parameter a1 t2)
(action_with_requirement a1 typing)
(action_with_parameter a2 t1)
(action_with_requirement a2 equality)
(action_with_parameter a3 t1)
(action_with_requirement a3 action-costs)
(action_with_requirement a3 equality)
)
)
)
