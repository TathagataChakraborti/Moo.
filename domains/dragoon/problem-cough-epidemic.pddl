(define (problem cough-epidemic)
(:domain dragoon-activity)

(:objects 
	infected_students healthy_students - accumulator
	probability_infected probability_healthy infectious_meetings - function
	total_students meetings - parameter
	epidemic_growth - epidemic
	da1 df1 dp1 da2 df2 dp2 df3 - description
	ta1 tf1 tp1 ta2 tf2 tp2 tf3 - type
	va1 vp1 va2 vp2 - value
	ua1 uf1 up1 ua2 uf2 up2 uf3 - units
	ea1 ef1 ea2 ef2 ef3 - equation

)

(:init
	(is_part infected_students epidemic_growth)
	(is_part healthy_students epidemic_growth)
	(is_part probability_infected epidemic_growth)
	(is_part probability_healthy epidemic_growth)
	(is_part meetings epidemic_growth)
	(is_part infectious_meetings epidemic_growth)
	(is_part total_students epidemic_growth)
	(has_property da1 infected_students)
	(has_property ta1 infected_students)
	(has_property va1 infected_students)
	(has_property ua1 infected_students)
	(has_property ea1 infected_students)
	(has_property da2 healthy_students)
	(has_property ta2 healthy_students)
	(has_property va2 healthy_students)
	(has_property ua2 healthy_students)
	(has_property ea2 healthy_students)
	(has_property df1 probability_infected)
	(has_property tf1 probability_infected)
	(has_property uf1 probability_infected)
	(has_property ef1 probability_infected)
	(has_property df2 probability_healthy)
	(has_property tf2 probability_healthy)
	(has_property uf2 probability_healthy)
	(has_property ef2 probability_healthy)    
	(has_property df3 infectious_meetings)
	(has_property tf3 infectious_meetings)
	(has_property uf3 infectious_meetings)
	(has_property ef3 infectious_meetings)
	(has_property dp1 total_students)
	(has_property tp1 total_students)
	(has_property vp1 total_students)
	(has_property up1 total_students)
	(has_property dp2 meetings)
	(has_property tp2 meetings)
	(has_property vp2 meetings)
	(has_property up2 meetings)

)

(:goal
    (and
	(applied_schema epidemic_growth)
	(applied_epidemic_schema total_students meetings probability_infected probability_healthy infectious_meetings infected_students healthy_students)
	)
)
)
