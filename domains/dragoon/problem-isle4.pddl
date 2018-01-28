(define (problem isle4)
(:domain dragoon-activity)

(:objects
	moose_population - accumulator
	moose_births moose_deaths moose_death_probability - function
	moose_birth_probability moose_capacity - parameter
	exponential_growth - exponential
	exponential_decay - extended_exponential
	carrying_capacity - capacity
	da df1 dp1 df2 dp2 df3 - description
	ta tf1 tp1 tf2 tp2 tf3 - type
	va vp1 vp2 - value
	ua uf1 up1 uf2 up2 uf3 - units
	ea ef1 ef2 ef3 - equation
)

(:init
	(is_part moose_population exponential_growth)
	(is_part moose_births exponential_growth)
	(is_part moose_birth_probability exponential_growth)
	(is_part moose_population exponential_decay)
	(is_part moose_deaths exponential_decay)
	(is_part moose_death_probability exponential_decay)
	(is_part moose_capacity carrying_capacity)
	(is_part moose_death_probability carrying_capacity)
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
	(has_property df3 moose_death_probability)
	(has_property tf3 moose_death_probability)
	(has_property uf3 moose_death_probability)
	(has_property ef3 moose_death_probability)
	(has_property dp2 moose_capacity)
	(has_property tp2 moose_capacity)
	(has_property vp2 moose_capacity)
	(has_property up2 moose_capacity)
)

(:goal
	(and
		(applied_schema exponential_growth)
		(applied_schema exponential_decay)
		(applied_schema carrying_capacity)
		(applied_exponential_schema moose_birth_probability moose_births moose_population)
		(applied_extended_exponential_schema moose_death_probability moose_deaths moose_population)
		(applied_capacity_schema moose_capacity moose_death_probability)
	)
)
)