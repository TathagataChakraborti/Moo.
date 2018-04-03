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
%INIT
)

(:goal
	(and
	%GOAL%
	)
)
)
