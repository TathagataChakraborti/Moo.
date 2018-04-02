(define (problem isle1)
(:domain dragoon-activity)

(:objects
	s1 - student
	moose_population - accumulator
	moose_births - parameter
	linear_growth - linear
	da dp - description
	ta tp - type
	va vp - value
	ua up - units
	ea - equation
)

(:init
	(is_part moose_population linear_growth)
	(is_part moose_births linear_growth)
	(has_property da moose_population)
	(has_property ta moose_population)
	(has_property va moose_population)
	(has_property ua moose_population)
	(has_property ea moose_population)
	(has_property dp moose_births)
	(has_property tp moose_births)
	(has_property vp moose_births)
	(has_property up moose_births)
	(has_schema s1 linear_growth)
)

(:goal
	(and
	(applied_schema s1 linear_growth)
	(applied_linear_schema moose_births moose_population)
	)
)
)
