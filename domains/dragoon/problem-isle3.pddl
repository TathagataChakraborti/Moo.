(define (problem isle3)
(:domain dragoon-activity)

(:objects 
	moose_population - accumulator
	moose_births moose_deaths - function
	moose_birth_probability moose_death_probability - parameter
	exponential_growth exponential_decay - exponential
	da df1 dp1 df2 dp2 - description
	ta tf1 tp1 tf2 tp2 - type
	va vp1 vp2 - value
	ua uf1 up1 uf2 up2 - units
	ea ef1 ef2 - equation
)

(:init
	(is_part moose_population exponential_growth)
	(is_part moose_births exponential_growth)
	(is_part moose_birth_probability exponential_growth)
	(is_part moose_population exponential_decay)
	(is_part moose_deaths exponential_decay)
	(is_part moose_death_probability exponential_decay)
	(has_property da moose_population)
	(has_property ta moose_population)
	(has_property va moose_population)
	(has_property ua moose_population)
	(has_property ea moose_population)
	(has_property df1 moose_births)
	(has_property tf1 moose_births)
	(has_property uf1 moose_births)
	(has_property ef1 moose_births)
	(has_property dp1 moose_birth_probability)
	(has_property tp1 moose_birth_probability)
	(has_property vp1 moose_birth_probability)
	(has_property up1 moose_birth_probability)
	(has_property df2 moose_deaths)
	(has_property tf2 moose_deaths)
	(has_property uf2 moose_deaths)
	(has_property ef2 moose_deaths)
	(has_property dp2 moose_death_probability)
	(has_property tp2 moose_death_probability)
	(has_property vp2 moose_death_probability)
	(has_property up2 moose_death_probability)
)
(:goal
	(and
		(applied_schema exponential_growth)
		(applied_schema exponential_decay)
		(applied_exponential_schema moose_birth_probability moose_births moose_population)
		(applied_exponential_schema moose_death_probability moose_deaths moose_population)
	)
)
)
