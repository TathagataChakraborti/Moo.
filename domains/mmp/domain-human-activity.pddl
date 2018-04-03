(define (domain dragoon-activity)
(:requirements :strips :typing :equality)

(:types
property node schema student - object
description type value equation units - property
accumulator function parameter - node
linear exponential epidemic capacity interaction - schema
extended_exponential - exponential
population_interaction - interaction
)

(:predicates
(is_filled ?p - property ?n - node)
(is_complete ?n - node)
(init ?n - node)
(has_property ?p - property ?n - node)
(has_schema ?c - student ?s - schema)
(applied_schema ?c - student ?s - schema)
(applied_epidemic_schema ?p1 ?p2 - parameter ?f1 ?f2 ?f3 - function ?a1 ?a2 - accumulator)
(applied_exponential_schema ?p - parameter ?f - function ?a - accumulator)
(applied_extended_exponential_schema ?f1 ?f2 - function ?a - accumulator)
(applied_capacity_schema ?p - parameter ?f - function)
(applied_interaction_schema ?p1 ?p2 - parameter ?f1 ?f2 - function ?a1 ?a2 - accumulator)
(applied_linear_schema ?p - parameter ?a - accumulator)
(is_part ?n - node ?s - schema)
)

(:action create_node
	:parameters (?n - node)
	:precondition (and)
	:effect (and (init ?n))
)

(:action fill_description
	:parameters (?p - description ?n - node)
	:precondition (and (has_property ?p ?n) (init ?n))
	:effect (and (is_filled ?p ?n))
)

(:action fill_type_single_schema
	:parameters (?t - type ?d - description ?n - node ?c - student ?s - schema)
	:precondition (and
					(has_schema ?c ?s)
					(is_part ?n ?s)
					(has_property ?t ?n)
					(is_filled ?d ?n)
				)
	:effect (and (is_filled ?t ?n))
)

(:action fill_type_double_schema
	:parameters (?t - type ?d - description ?n - node ?c - student ?s ?s1 - schema)
	:precondition (and
					(has_schema ?c ?s)
					(has_schema ?c ?s1)
					(has_property ?t ?n)
					(is_part ?n ?s)
					(is_part ?n ?s1)
					(is_filled ?d ?n)
					(not (= ?s ?s1))
				)
	:effect (and (is_filled ?t ?n))
)

(:action fill_type_triple_schema
	:parameters (?t - type ?d - description ?n - node ?c - student ?s ?s1 ?s2 - schema)
	:precondition (and
					(has_schema ?c ?s)
					(has_schema ?c ?s1)
					(has_schema ?c ?s2)
					(has_property ?t ?n)
					(is_part ?n ?s)
					(is_part ?n ?s1)
					(is_part ?n ?s2)
					(is_filled ?d ?n)
					(not (= ?s ?s1))
					(not (= ?s ?s2))
					(not (= ?s1 ?s2))
				)
	:effect (and (is_filled ?t ?n))
)

(:action fill_value
	:parameters (?v - value ?t - type ?n - node)
	:precondition (and (has_property ?v ?n) (is_filled ?t ?n))
	:effect (and (is_filled ?v ?n))
)

(:action fill_units
	:parameters (?u - units ?t - type ?n - node)
	:precondition (and (has_property ?u ?n) (is_filled ?t ?n))
	:effect (and (is_filled ?u ?n))
)

(:action fill_equation_single_schema
	:parameters (?e - equation ?t - type ?n - node ?c - student ?s - schema)
	:precondition (and
					(has_schema ?c ?s)
					(is_part ?n ?s)
					(has_property ?e ?n)
					(is_filled ?t ?n)
				)
	:effect (and (is_filled ?e ?n))
)

(:action fill_equation_double_schema
	:parameters (?e - equation ?t - type ?n - node ?c - student ?s ?s1 - schema)
	:precondition (and
					(has_schema ?c ?s)
					(has_schema ?c ?s1)
					(has_property ?e ?n)
					(is_part ?n ?s)
					(is_part ?n ?s1)
					(is_filled ?t ?n)
					(not (= ?s ?s1))
				)
	:effect (and (is_filled ?e ?n))
)

(:action fill_equation_triple_schema
	:parameters (?e - equation ?t - type ?n - node ?c - student ?s ?s1 ?s2 - schema)
	:precondition (and
					(has_schema ?c ?s)
					(has_schema ?c ?s1)
					(has_schema ?c ?s2)
					(has_property ?e ?n)
					(is_part ?n ?s)
					(is_part ?n ?s1)
					(is_filled ?t ?n)
					(not (= ?s ?s1))
					(not (= ?s ?s2))
					(not (= ?s1 ?s2))
				)
	:effect (and (is_filled ?e ?n))
)

(:action complete_accumulator
	:parameters (?d - description ?t - type ?v - value ?u - units ?e - equation ?n - accumulator)
	:precondition (and
					(init ?n)
					(is_filled ?d ?n)
					(is_filled ?t ?n)
					(is_filled ?v ?n)
					(is_filled ?u ?n)
					(is_filled ?e ?n)
				)
	:effect (and (is_complete ?n))
)

(:action complete_parameter
	:parameters (?d - description ?t - type ?v - value ?u - units ?n - parameter)
	:precondition (and
					(init ?n)
					(is_filled ?d ?n)
					(is_filled ?t ?n)
					(is_filled ?v ?n)
					(is_filled ?u ?n)
				)
	:effect (and (is_complete ?n))
)

(:action complete_function
	:parameters (?d - description ?t - type ?u - units ?e - equation ?n - function)
	:precondition (and
					(init ?n)
					(is_filled ?d ?n)
					(is_filled ?t ?n)
					(is_filled ?u ?n)
					(is_filled ?e ?n)
				)
	:effect (and (is_complete ?n))
)

(:action complete_linear_schema
	:parameters (?p - parameter ?a - accumulator ?s - linear ?c - student)
	:precondition (and
					(is_part ?p ?s)
					(is_complete ?p)
					(is_part ?a ?s)
					(is_complete ?a)
				)
	:effect (and (applied_schema ?c ?s) (applied_linear_schema ?p ?a))
)

(:action complete_exponential_schema
	:parameters (?p - parameter ?f - function ?a - accumulator ?s - exponential  ?c - student)
	:precondition (and
					(is_part ?p ?s)
					(is_complete ?p)
					(is_part ?f ?s)
					(is_complete ?f)
					(is_part ?a ?s)
					(is_complete ?a)
				)
	:effect (and (applied_schema ?c ?s) (applied_exponential_schema ?p ?f ?a))
)

(:action complete_extended_exponential_schema
	:parameters (?f1 ?f2 - function ?a - accumulator ?s - extended_exponential  ?c - student)
	:precondition (and
					(is_part ?f1 ?s)
					(is_complete ?f1)
					(is_part ?f2 ?s)
					(is_complete ?f2)
					(is_part ?a ?s)
					(is_complete ?a)
				)
	:effect (and (applied_schema ?c ?s) (applied_extended_exponential_schema ?f1 ?f2 ?a))
)

(:action complete_capacity_schema
	:parameters (?p - parameter ?f - function ?s - capacity  ?c - student)
	:precondition (and
					(is_part ?p ?s)
					(is_complete ?p)
					(is_part ?f ?s)
					(is_complete ?f)
				)
	:effect (and (applied_schema ?c ?s) (applied_capacity_schema ?p ?f))
)

(:action complete_interaction_schema
	:parameters (?p1 ?p2 - parameter ?f1 ?f2 - function ?a1 ?a2 - accumulator ?s - interaction  ?c - student)
	:precondition (and
					(is_part ?p1 ?s)
					(is_part ?p2 ?s)
					(is_complete ?p1)
					(is_complete ?p2)
					(is_part ?f1 ?s)
					(is_part ?f2 ?s)
					(is_complete ?f1)
					(is_complete ?f2)
					(is_part ?a1 ?s)
					(is_part ?a2 ?s)
					(is_complete ?a1)
					(is_complete ?a2)
				)
	:effect (and (applied_schema ?c ?s) (applied_interaction_schema ?p1 ?p2 ?f1 ?f2 ?a1 ?a2))
)

(:action complete_epidemic_schema
	:parameters (?p1 ?p2 - parameter ?f1 ?f2 ?f3 - function ?a1 ?a2 - accumulator ?s - epidemic ?c - student)
	:precondition (and
					(is_part ?p1 ?s)
					(is_part ?p2 ?s)
					(is_complete ?p1)
					(is_complete ?p2)
					(is_part ?f1 ?s)
					(is_part ?f2 ?s)
					(is_part ?f3 ?s)
					(is_complete ?f1)
					(is_complete ?f2)
					(is_complete ?f3)
					(is_part ?a1 ?s)
					(is_part ?a2 ?s)
					(is_complete ?a1)
					(is_complete ?a2)
				)
	:effect (and (applied_schema ?c ?s) (applied_epidemic_schema ?p1 ?p2 ?f1 ?f2 ?f3 ?a1 ?a2))
)
)