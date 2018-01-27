(define (problem isle2)
(:domain dragoon-activity)

(:objects 
	moose_population - accumulator
	moose_births - function
	moose_birth_probability - parameter
	exponential_growth - schema
)

(:init
	(is_part moose_population exponential_growth)
	(is_part moose_births exponential_growth)
	(is_part moose_birth_probability exponential_growth)
	(= (total-cost) 0)
)

(:goal
	(applied_schema exponential_growth)
)
(:metric minimize (total-cost))
)
