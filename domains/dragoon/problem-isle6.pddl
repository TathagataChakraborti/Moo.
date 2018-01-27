(define (problem isle6)
(:domain dragoon-activity)

(:objects 
	moose_population wolf_population - accumulator
	moose_births moose_deaths moose_death_probability wolf_births wolf_deaths wolf_birth_probability - function
	moose_birth_probability moose_capacity wolf_death_probability effect_of_moose_on_wolf effect_of_wolf_on_moose - parameter
	exponential_growth exponential_decay carrying_capacity - schema

)

(:init
	(is_part moose_population exponential_growth)
	(is_part moose_births exponential_growth)
	(is_part moose_birth_probability exponential_growth)
	(is_part wolf_population exponential_growth)
	(is_part wolf_births exponential_growth)
	(is_part wolf_birth_probability exponential_growth)
	(is_part moose_population exponential_decay)
	(is_part moose_deaths exponential_decay)
	(is_part moose_death_probability exponential_decay)
	(is_part wolf_population exponential_decay)
	(is_part worl_deaths exponential_decay)
	(is_part wolf_death_probability exponential_decay)
	(is_part moose_capacity carrying_capacity)
	(is_part moose_deaths carrying_capacity)
	(is_part moose_population carrying_capacity)
	(is_part wolf_population carrying_capacity)
	(is_part wolf_births carrying_capacity)
	(is_part effect_of_moose_on_wolf carrying_capacity)
	(is_part effect_of_wolf_on_moose carrying_capacity)
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
