(define (domain dragoon-activity)
(:requirements :strips :typing)

(:types
property node schema student - object
description type value equation units - property
accumulator function parameter - node
linear exponential epidemic capacity interaction electrical - schema
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
(apply_type ?c - student ?n - node ?s - schema)
(apply_type_double ?c - student ?n - node ?s ?s1 - schema)
(apply_type_triple ?c - student ?n - node ?s ?s1 ?s2 - schema)
(apply_equation ?c - student ?n - node ?s - schema)
(apply_equation_double ?c - student ?n - node ?s ?s1 - schema)
(apply_equation_triple ?c - student ?n - node ?s ?s1 ?s2 - schema)
)

%OPERATORS%

)
