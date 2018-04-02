(define (problem rabbits)
(:domain dragoon-activity)

(:objects 
	s1 - student
	rabbits - accumulator
	net_growth - function
	growth_rate - parameter
	exponential_growth - exponential
	da df dp - description
	ta tf tp - type
	va vp - value
	ua uf up - units
	ea ef - equation
)

(:init
	(is_part rabbits exponential_growth)
	(is_part net_growth exponential_growth)
	(is_part growth_rate exponential_growth)
	(has_property da rabbits)
	(has_property ta rabbits)
	(has_property va rabbits)
	(has_property ua rabbits)
	(has_property ea rabbits)
	(has_property df net_growth)
	(has_property tf net_growth)
	(has_property uf net_growth)
	(has_property ef net_growth)
	(has_property dp growth_rate)
	(has_property tp growth_rate)
	(has_property vp growth_rate)
	(has_property up growth_rate)
	(has_schema s1 exponential_growth)
)

(:goal
	(and
	(applied_schema s1 exponential_growth)
	(applied_exponential_schema growth_rate net_growth rabbits)
	)
)
)