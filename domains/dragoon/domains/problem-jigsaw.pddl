(define (problem class1)
(:domain dragoon-class)

(:objects
C3 C2 C1 - schema
T2 T3 T1 - tutorial 
A1 A3 A2 A5 A4 A6 - assignment
S1 S2 S3 S4 - student
)

(:init
(contains_schema A1 C1)
(contains_schema A3 C1)
(contains_schema A2 C2)
(contains_schema A5 C3)
(contains_schema A5 C1)
(contains_schema A4 C1)
(contains_schema A6 C2)
(contains_schema T2 C2)
(contains_schema T3 C3)
(contains_schema T1 C1)
)

(:goal
(and
(applied_schema S1 C3)
(applied_schema S1 C2)
(applied_schema S1 C1)
(applied_schema S2 C3)
(applied_schema S2 C2)
(applied_schema S2 C1)
(applied_schema S3 C3)
(applied_schema S3 C2)
(applied_schema S3 C1)
(applied_schema S4 C3)
(applied_schema S4 C2)
(applied_schema S4 C1)
)
)

)