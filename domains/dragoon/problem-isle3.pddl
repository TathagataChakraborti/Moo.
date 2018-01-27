(define (problem isle3)
(:domain dragoon-activity)

(:objects 
	moose_population - accumulator
	moose_births moose_deaths - function
	moose_birth_probability moose_death_probability - parameter
	exponential_growth exponential_decay - schema

)

(:init
	(is_part moose_population exponential_growth)
	(is_part moose_births exponential_growth)
	(is_part moose_birth_probability exponential_growth)
	(is_part moose_population exponential_decay)
	(is_part moose_births exponential_decay)
	(is_part moose_birth_probability exponential_decay)
	(= (total-cost) 0)
)

(:goal
	(and
		(applied_schema exponential_growth)
		(applied_schema exponential_decay)
	)
)
(:metric minimize (total-cost))
)
