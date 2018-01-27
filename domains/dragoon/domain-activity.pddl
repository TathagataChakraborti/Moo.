(define (domain dragoon-activity)
(:requirements :strips :typing) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; property is the smallest entity in Dragoon to be filled by a student
;;; node is equivalent to a quantity. A node is made of properties
;;; schema - combination of nodes connected by equations or relations
;;; for example exponential_growth schema
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(:types
property node schema - object
description type value equation units - property
accumulator function parameter - node
linear exponential epidemic - schema
)

(:predicates
(is_filled ?p - property ?n - node)
(is_complete ?n - node)
(understands_concept ?s - schema)
(applied_concept ?s - schema)
(has_property ?p - property ?n - node)
(has_node ?n - node ?s - schema)
(is_root ?n - node)
(is_node_parameter ?p - parameter)
(is_node_function ?f - function)
(is_node_accumulator ?a - accumulator)
(init ?n node)
(is_part ?n - node ?s - schema)
)

(:functions
	(total-cost)
)

(:action fill_property_description
	:parameters (?d - description ?n - node)
	:precondition (init ?n)
	:effect (and (is_filled ?d ?n) (increase total-cost 1))
)

(:action fill_property_type
	:parameters (?d - description ?t - type)
	:precondition (is_filled ?d)
	:effect (and (is_filled ?t ?n) (increase total-cost 1))
)

(:action fill_property_value
	:parameters (?t - type ?v - value ?a - a)
	:precondition (and (is_filled ?t) not(is_node_equation ?n - node))
	:effect (and (is_filled ?p ?n) (increase total-cost 1))
)

(:action fill_property_units
	:parameters (?v - value ?u - units ?n-node)
	:precondition (is_filled ?v ?n)
	:effect (and (is_filled ?u ?n) (increase total-cost 1))
)

(:action fill_property_equation
	:parameters (?u - units ?e - equation ?n - node)
	:precondition (and (is_filled ?u ?n) not(is_node_parameter ?n))
	:effect (and (is_filled ?u ?n) (increase total-cost 1))
)

(:action create_node
	:parameter (?n - node)
	:precondition ()
	:effect (and (init ?n) (increase total-cost 1))
)

(:action complete_node
	:parameter (?n - node ?d - description ?t - type ?v - value ?u - unit ?e - equation)
	:precondition (and 	(is_filled ?d ?n)
						(is_filled ?t ?n)
						(or (is_filled ?v ?n) (is_node_function ?n))
						(is_filled ?u ?n)
						(or (is_filled ?e) (is_node_parameter ?n)))
	:effect (and (is_complete ?n) (increase total-cost 0))
	)
)

(:action complete_schema
	:parameter (?n - node ?s - schema)
	:precondition (and (is_part ?n ?s) (is_complete ?n))
	:effect (and (applied_schema ?s) (increase total-cost 0))
)
)
