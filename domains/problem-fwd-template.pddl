(define (problem prob-curriculum)
(:domain curriculum)

(:objects 
{S} - student
{C} - concept
{T} - tutorial
{A} - activity
)

(:init 
{I}
(= (total-cost) 0)
)

(:goal
(and
{G}
)
)

(:metric minimize (total-cost))

)
