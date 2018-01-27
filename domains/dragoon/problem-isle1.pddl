(define (problem isle1)
(:domain dragoon-activity)

(:objects 
	moose_population - accumulator
	moose_births - parameter
	linear_growth - schema
)

(:init
	(is_part moose_population linear_growth)
	(is_part moose_births linear_growth)
	(= (total-cost) 0)
)

(:goal
	(applied_schema linear_growth)
)
(:metric minimize (total-cost))
)
