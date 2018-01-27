(define (problem isle5)
(:domain dragoon-activity)

(:objects 
	wolf_population - accumulator
	wolf_births wolf_deaths - function
	wolf_birth_probability wolf_death_probability - parameter
	exponential_growth exponential_decay - schema

)

(:init
	(is_part wolf_population exponential_growth)
	(is_part wolf_births exponential_growth)
	(is_part wolf_birth_probability exponential_growth)
	(is_part wolf_population exponential_decay)
	(is_part wolf_births exponential_decay)
	(is_part wolf_birth_probability exponential_decay)
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
