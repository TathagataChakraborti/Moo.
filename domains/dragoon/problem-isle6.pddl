(define (problem isle6)
(:domain dragoon-activity)

(:objects 
	s1 - student
	moose_population wolf_population - accumulator
	moose_births moose_deaths moose_death_probability wolf_births wolf_deaths wolf_birth_probability - function
	moose_birth_probability wolf_death_probability effect_of_moose_on_wolf effect_of_wolf_on_moose - parameter
	exponential_moose_growth exponential_wolf_decay - exponential
	exponential_wolf_growth exponential_moose_decay - extended_exponential
	predator_prey - population_interaction
	da1 df1 dp1 da2 df2 dp2 df3 dp3 df4 dp4 df5 df6 - description
	ta1 tf1 tp1 ta2 tf2 tp2 tf3 tp3 tf4 tp4 tf5 tf6 - type
	va1 vp1 va2 vp2 vp3 vp4 - value
	ua1 uf1 up1 ua2 uf2 up2 uf3 up3 uf4 up4 uf5 uf6 - units
	ea1 ef1 ea2 ef2 ef3 ef4 ef5 ef6 - equation
)

(:init
	(is_part moose_population exponential_moose_growth)
	(is_part moose_births exponential_moose_growth)
	(is_part moose_birth_probability exponential_moose_growth)
	(is_part wolf_population exponential_wolf_growth)
	(is_part wolf_births exponential_wolf_growth)
	(is_part wolf_birth_probability exponential_wolf_growth)
	(is_part moose_population exponential_moose_decay)
	(is_part moose_deaths exponential_moose_decay)
	(is_part moose_death_probability exponential_moose_decay)
	(is_part wolf_population exponential_wolf_decay)
	(is_part wolf_deaths exponential_wolf_decay)
	(is_part wolf_death_probability exponential_wolf_decay)
	(is_part moose_death_probability predator_prey)
	(is_part wolf_birth_probability predator_prey)
	(is_part effect_of_moose_on_wolf predator_prey)
	(is_part effect_of_wolf_on_moose predator_prey)
	(is_part moose_population predator_prey)
	(is_part wolf_population predator_prey)
	(has_property da1 moose_population)
	(has_property ta1 moose_population)
	(has_property va1 moose_population)
	(has_property ua1 moose_population)
	(has_property ea1 moose_population)
	(has_property da2 wolf_population)
	(has_property ta2 wolf_population)
	(has_property va2 wolf_population)
	(has_property ua2 wolf_population)
	(has_property ea2 wolf_population)
	(has_property df1 moose_births)
	(has_property tf1 moose_births)
	(has_property uf1 moose_births)
	(has_property ef1 moose_births)
	(has_property df2 moose_deaths)
	(has_property tf2 moose_deaths)
	(has_property uf2 moose_deaths)
	(has_property ef2 moose_deaths)
	(has_property df3 moose_death_probability)
	(has_property tf3 moose_death_probability)
	(has_property uf3 moose_death_probability)
	(has_property ef3 moose_death_probability)
	(has_property df4 wolf_births)
	(has_property tf4 wolf_births)
	(has_property uf4 wolf_births)
	(has_property ef4 wolf_births)
	(has_property df5 wolf_deaths)
	(has_property tf5 wolf_deaths)
	(has_property uf5 wolf_deaths)
	(has_property ef5 wolf_deaths)
	(has_property df6 wolf_birth_probability)
	(has_property tf6 wolf_birth_probability)
	(has_property uf6 wolf_birth_probability)
	(has_property ef6 wolf_birth_probability)
	(has_property dp1 moose_birth_probability)
	(has_property tp1 moose_birth_probability)
	(has_property vp1 moose_birth_probability)
	(has_property up1 moose_birth_probability)
	(has_property dp2 wolf_death_probability)
	(has_property tp2 wolf_death_probability)
	(has_property vp2 wolf_death_probability)
	(has_property up2 wolf_death_probability)
	(has_property dp3 effect_of_moose_on_wolf)
	(has_property tp3 effect_of_moose_on_wolf)
	(has_property vp3 effect_of_moose_on_wolf)
	(has_property up3 effect_of_moose_on_wolf)
	(has_property dp4 effect_of_wolf_on_moose)
	(has_property tp4 effect_of_wolf_on_moose)
	(has_property vp4 effect_of_wolf_on_moose)
	(has_property up4 effect_of_wolf_on_moose)
	(has_schema s1 exponential_moose_growth)
	(has_schema s1 exponential_wolf_decay)
	(has_schema s1 exponential_wolf_growth)
	(has_schema s1 exponential_moose_decay)
	(has_schema s1 predator_prey)
)

(:goal
	(and
		(applied_schema s1 exponential_moose_growth)
		(applied_schema s1 exponential_wolf_growth)
		(applied_schema s1 exponential_moose_decay)
		(applied_schema s1 exponential_wolf_decay)
		(applied_schema s1 predator_prey)
		(applied_exponential_schema moose_birth_probability moose_births moose_population)
		(applied_extended_exponential_schema moose_death_probability moose_deaths moose_population)
		(applied_exponential_schema wolf_death_probability wolf_deaths wolf_population)
		(applied_extended_exponential_schema wolf_birth_probability wolf_births wolf_population)
		(applied_interaction_schema effect_of_moose_on_wolf effect_of_wolf_on_moose moose_death_probability wolf_birth_probability moose_population wolf_population)
	)
)
)
