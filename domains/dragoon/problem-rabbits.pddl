(define (problem rabbits)
(:domain dragoon-activity)

(:objects 
	rabbits - accumulator
	net_growth - function
	growth_rate - parameter
	exponential_growth - schema
)

(:init
	(is_part rabbits exponential_growth)
	(is_part net_growth exponential_growth)
	(is_part growth_rate exponential_growth)
	(= (total-cost) 0)
)

(:goal
	(applied_schema exponential_growth)
)
(:metric minimize (total-cost))
)
