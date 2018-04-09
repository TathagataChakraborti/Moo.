(define (problem zener)
(:domain dragoon-activity)

(:objects
    s1 - student
    resistor_behavior zener_avalanche zener_voltage_regulator kvl - electrical
	v_across_r1 v_across_load current_thru_r - function
	df4 df5 df6 - description
    tf4 tf5 tf6 - type
    uf4 uf5 uf6 - units
    ef4 ef5 ef6 - equation
)

(:init
	(is_part v_across_r1 kvl)
	(is_part v_across_r1 zener_voltage_regulator)
	(is_part v_across_load zener_voltage_regulator)
	(is_part current_thru_r zener_voltage_regulator)
	(has_property df4 v_across_r1)
	(has_property tf4 v_across_r1)
	(has_property uf4 v_across_r1)
	(has_property ef4 v_across_r1)
	(has_property df5 v_across_load)
	(has_property tf5 v_across_load)
	(has_property uf5 v_across_load)
	(has_property ef5 v_across_load)
	(has_property df6 current_thru_r)
	(has_property tf6 current_thru_r)
	(has_property uf6 current_thru_r)
	(has_property ef6 current_thru_r)
	(has_schema s1 zener_voltage_regulator)
	(has_schema s1 kvl)
;	(is_expert s1)
)

(:goal
    (and
	(applied_schema s1 zener_voltage_regulator)
	(applied_schema s1 kvl)
	(applied_zener_voltage_regulator_schema v_across_r1 v_across_load current_thru_r)
	(applied_kvl_schema_temp v_across_r1)
	(apply_type_double s1 v_across_r1 kvl zener_voltage_regulator)
	(apply_equation_double s1 v_across_r1 kvl zener_voltage_regulator)
	(apply_type s1 v_across_load zener_voltage_regulator)
	(apply_equation s1 v_across_load zener_voltage_regulator)
	(apply_type s1 current_thru_r zener_voltage_regulator)
	(apply_equation s1 current_thru_r zener_voltage_regulator)
	)
)
)
