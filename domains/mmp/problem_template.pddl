(define (problem isle4)
(:domain dragoon-activity)

(:objects
	s1 - student
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
	%INIT%
)

(:goal
	(and
	%GOAL%
	)
)
)
