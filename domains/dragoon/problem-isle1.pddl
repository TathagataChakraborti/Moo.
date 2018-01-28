(define (problem isle1)
(:domain dragoon-activity)

(:objects 
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
)

(:goal
	(applied_schema linear_growth)
)
)
