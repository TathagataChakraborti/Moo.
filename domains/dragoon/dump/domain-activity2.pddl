(define (domain dragoon-activity)
(:requirements :strips :typing :negative-preconditions) 

(:types
property node schema
description type value equation units - property
accumulator function parameter - node
linear exponential epidemic - schema
)

(:predicates
(is_filled ?x - property ?n - node)
(is_complete ?n - node)
(understands_concept ?s - schema)
(applied_schema ?s - schema)
(has_node ?n - node ?s - schema)
(is_root ?n - node)
(is_node_parameter ?p - parameter)
(is_node_function ?f - function)
(is_node_accumulator ?a - accumulator)
(init ?n - node)
(is_part ?n - node ?s - schema)
)

(:action fill_property_description
	:parameters (?d - description ?n - node)
	:precondition (and (init ?n))
	:effect (and (is_filled ?d ?n))
)

(:action fill_property_type
	:parameters (?d - description ?t - type ?n - node)
	:precondition (and (is_filled ?d ?n))
	:effect (and (is_filled ?t ?n))
)

(:action fill_property_value
	:parameters (?t - type ?v - value ?n - node)
	:precondition (and (is_filled ?t ?n) (not (is_node_function ?n)))
	:effect (and (is_filled ?v ?n))
)

(:action fill_property_units
	:parameters (?v - value ?u - units ?n - node)
	:precondition (and (is_filled ?v ?n))
	:effect (and (is_filled ?u ?n))
)

(:action fill_property_equation
	:parameters (?u - units ?e - equation ?n - node)
	:precondition (and (is_filled ?u ?n) (not (is_node_parameter ?n)))
	:effect (and (is_filled ?e ?n))
)

(:action create_node
	:parameters (?n - node)
	:precondition (and)
	:effect (and (init ?n))
)

(:action complete_node
	:parameters (?n - node ?d - description ?t - type ?v - value ?u - units ?e - equation)
	:precondition (and 	(is_filled ?d ?n)
						(is_filled ?t ?n)
						;(not (is_filled ?v ?n) (is_node_function ?n))
						(is_filled ?u ?n)
						;(or (is_filled ?e ?n) (is_node_parameter ?n))
					)
	:effect (and (is_complete ?n))
)

(:action complete_schema
	:parameters (?n - node ?s - schema)
	:precondition (and (is_part ?n ?s) (is_complete ?n))
	:effect (and (applied_schema ?s))
)

)
