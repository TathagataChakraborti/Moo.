(define (problem isle4)
(:domain dragoon-activity)

(:objects 
	moose_population - accumulator
	moose_births moose_deaths moose_death_probability - function
	moose_birth_probability moose_capacity- parameter
	exponential_growth exponential_decay carrying_capacity - schema

)

(:init
	(is_part moose_population exponential_growth)
	(is_part moose_births exponential_growth)
	(is_part moose_birth_probability exponential_growth)
	(is_part moose_population exponential_decay)
	(is_part moose_births exponential_decay)
	(is_part moose_birth_probability exponential_decay)
	(is_part moose_capacity carrying_capacity)
	(is_part moose_deaths carrying_capacity)
	(is_part moose_population carrying_capacity)
	(= (total-cost) 0)
)

(:goal
	(and
		(applied_schema exponential_growth)
		(applied_schema exponential_decay)
		(applied_schema carrying_capacity)
	)
)
(:metric minimize (total-cost))
)
