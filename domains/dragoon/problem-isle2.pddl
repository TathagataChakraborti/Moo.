(define (problem isle2)
(:domain dragoon-activity)

(:objects 
	moose_population - accumulator
	moose_births - function
	moose_birth_probability - parameter
	exponential_growth - exponential
	da df dp - description
	ta tf tp - type
	va vp - value
	ua uf up - units
	ea ef - equation
)

(:init
	(is_part moose_population exponential_growth)
	(is_part moose_births exponential_growth)
	(is_part moose_birth_probability exponential_growth)
	(has_property da moose_population)
	(has_property ta moose_population)
	(has_property va moose_population)
	(has_property ua moose_population)
	(has_property ea moose_population)
	(has_property df moose_births)
	(has_property tf moose_births)
	(has_property uf moose_births)
	(has_property ef moose_births)
	(has_property dp moose_birth_probability)
	(has_property tp moose_birth_probability)
	(has_property vp moose_birth_probability)
	(has_property up moose_birth_probability)
)

(:goal
	(and
	(applied_schema exponential_growth)
	(applied_exponential_schema moose_birth_probability moose_births moose_population)
	)
)
)
