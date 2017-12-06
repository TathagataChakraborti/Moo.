(define (domain activity)
(:requirements :strips :typing)

(:types 
req typ name - object
)

(:predicates
(has_concept ?r - req)
(action_with_parameter ?n - name ?t - typ)
(action_with_requirement ?n - name ?r - req)
)


(:action define_action_1_t2
:parameters (?n - name ?r - req)
:precondition
(and


)
:effect
(and
( action_with_parameter ?n t2 )
( action_with_requirement ?n ?r )

)
)

(:action define_action_1_t1
:parameters (?n - name ?r - req)
:precondition
(and


)
:effect
(and
( action_with_requirement ?n ?r )
( action_with_parameter ?n t1 )

)
)

(:action define_action_1
:parameters (?t - typ ?n - name ?r - req)
:precondition
(and
( has_concept typing )

)
:effect
(and
( action_with_requirement ?n ?r )
( action_with_parameter ?n t2 )
( action_with_parameter ?n t1 )

)
)

(:action define_action_2
:parameters (?t - typ ?n - name ?r1 ?r2 - req)
:precondition
(and
( has_concept typing )

)
:effect
(and
( action_with_requirement ?n ?r2 )
( action_with_parameter ?n t2 )
( action_with_parameter ?n t1 )
( action_with_requirement ?n ?r1 )

)
)

(:action define_action_3
:parameters (?t - typ ?n - name ?r1 ?r2 ?r3 - req)
:precondition
(and
( has_concept typing )

)
:effect
(and
( action_with_requirement ?n ?r2 )
( action_with_requirement ?n ?r3 )
( action_with_parameter ?n t2 )
( action_with_parameter ?n t1 )
( action_with_requirement ?n ?r1 )

)
)


)


