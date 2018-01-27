(define (problem cough-epidemic)
(:domain dragoon-activity)

(:objects 
	infected_students healthy_students - accumulator
	probability_infected probability_healthy infectious_meetings - function
	total_students meetings - parameter
	epidemic - schema
)

(:init
	(is_part infected_students epidemic)
	(is_part healthy_students epidemic)
	(is_part probability_infected epidemic)
	(is_part probability_healthy epidemic)
	(is_part meetings epidemic)
	(is_part infectious_meetings epidemic)
	(is_part total_students epidemic)
	(= (total-cost) 0)
)

(:goal
	(applied_schema epidemic)
)
(:metric minimize (total-cost))
)
