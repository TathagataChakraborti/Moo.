(define (problem isle5)
(:domain dragoon-activity)

(:objects 
	s1 - student
	wolf_population - accumulator
	wolf_births wolf_deaths - function
	wolf_birth_probability wolf_death_probability - parameter
	exponential_growth exponential_decay - exponential
	da df1 dp1 df2 dp2 - description
	ta tf1 tp1 tf2 tp2 - type
	va vp1 vp2 - value
	ua uf1 up1 uf2 up2 - units
	ea ef1 ef2 - equation

)

(:init
	(is_part wolf_population exponential_growth)
	(is_part wolf_births exponential_growth)
	(is_part wolf_birth_probability exponential_growth)
	(is_part wolf_population exponential_decay)
	(is_part wolf_deaths exponential_decay)
	(is_part wolf_death_probability exponential_decay)	
	(has_property da wolf_population)
	(has_property ta wolf_population)
	(has_property va wolf_population)
	(has_property ua wolf_population)
	(has_property ea wolf_population)
	(has_property df1 wolf_births)
	(has_property tf1 wolf_births)
	(has_property uf1 wolf_births)
	(has_property ef1 wolf_births)
	(has_property dp1 wolf_birth_probability)
	(has_property tp1 wolf_birth_probability)
	(has_property vp1 wolf_birth_probability)
	(has_property up1 wolf_birth_probability)
	(has_property df2 wolf_deaths)
	(has_property tf2 wolf_deaths)
	(has_property uf2 wolf_deaths)
	(has_property ef2 wolf_deaths)
	(has_property dp2 wolf_death_probability)
	(has_property tp2 wolf_death_probability)
	(has_property vp2 wolf_death_probability)
	(has_property up2 wolf_death_probability)
	(has_schema s1 exponential_growth)
	(has_schema s1 exponential_decay)
)

(:goal
	(and
		(applied_schema s1 exponential_growth)
		(applied_schema s1 exponential_decay)
		(applied_exponential_schema wolf_birth_probability wolf_births wolf_population)
		(applied_exponential_schema wolf_death_probability wolf_deaths wolf_population)
	)
)
)
