(define (domain grounded-FETCHWORLD)
(:predicates
(on_b_a)
(on_b_d)
(on_b_b)
(holding_c)
(on_a_a)
(ontable_d)
(ontable_c)
(on_c_c)
(holding_a)
(on_a_d)
(on_a_b)
(ontable_a)
(on_c_b)
(on_b_c)
(on_d_a)
(clear_d)
(clear_a)
(on_d_d)
(on_c_d)
(on_d_c)
(handempty)
(on_a_c)
(holding_d)
(holding_b)
(on_d_b)
(clear_c)
(on_c_a)
(clear_b)
(ontable_b)
)

	(:action unstack_a_a
		:parameters ()
		:precondition
		(and 
			(clear_a)
			(on_a_a)
			(handempty))
		:effect
		(and 
			(holding_a)
			(not (handempty))
		)
	)
	(:action unstack_a_c
		:parameters ()
		:precondition
		(and 
			(clear_a)
			(on_a_c)
			(handempty))
		:effect
		(and 
			(holding_a)
			(not (handempty))
		)
	)
	(:action unstack_a_d
		:parameters ()
		:precondition
		(and 
			(on_a_d)
			(clear_a)
			(handempty))
		:effect
		(and 
			(holding_a)
			(not (handempty))
		)
	)
	(:action unstack_a_b
		:parameters ()
		:precondition
		(and 
			(clear_a)
			(on_a_b)
			(handempty))
		:effect
		(and 
			(holding_a)
			(not (handempty))
		)
	)
	(:action unstack_c_a
		:parameters ()
		:precondition
		(and 
			(clear_c)
			(on_c_a)
			(handempty))
		:effect
		(and 
			(holding_c)
			(not (handempty))
		)
	)
	(:action unstack_c_c
		:parameters ()
		:precondition
		(and 
			(clear_c)
			(handempty)
			(on_c_c))
		:effect
		(and 
			(holding_c)
			(not (handempty))
		)
	)
	(:action unstack_c_d
		:parameters ()
		:precondition
		(and 
			(clear_c)
			(on_c_d)
			(handempty))
		:effect
		(and 
			(holding_c)
			(not (handempty))
		)
	)
	(:action unstack_c_b
		:parameters ()
		:precondition
		(and 
			(on_c_b)
			(clear_c)
			(handempty))
		:effect
		(and 
			(holding_c)
			(not (handempty))
		)
	)
	(:action unstack_d_a
		:parameters ()
		:precondition
		(and 
			(on_d_a)
			(handempty)
			(clear_d))
		:effect
		(and 
			(holding_d)
			(not (handempty))
		)
	)
	(:action unstack_d_c
		:parameters ()
		:precondition
		(and 
			(on_d_c)
			(handempty)
			(clear_d))
		:effect
		(and 
			(holding_d)
			(not (handempty))
		)
	)
	(:action unstack_d_d
		:parameters ()
		:precondition
		(and 
			(on_d_d)
			(handempty)
			(clear_d))
		:effect
		(and 
			(holding_d)
			(not (handempty))
		)
	)
	(:action unstack_d_b
		:parameters ()
		:precondition
		(and 
			(on_d_b)
			(handempty)
			(clear_d))
		:effect
		(and 
			(holding_d)
			(not (handempty))
		)
	)
	(:action unstack_b_a
		:parameters ()
		:precondition
		(and 
			(on_b_a)
			(clear_b)
			(handempty))
		:effect
		(and 
			(holding_b)
			(not (handempty))
		)
	)
	(:action unstack_b_c
		:parameters ()
		:precondition
		(and 
			(on_b_c)
			(clear_b)
			(handempty))
		:effect
		(and 
			(holding_b)
			(not (handempty))
		)
	)
	(:action unstack_b_d
		:parameters ()
		:precondition
		(and 
			(on_b_d)
			(clear_b)
			(handempty))
		:effect
		(and 
			(holding_b)
			(not (handempty))
		)
	)
	(:action unstack_b_b
		:parameters ()
		:precondition
		(and 
			(clear_b)
			(handempty)
			(on_b_b))
		:effect
		(and 
			(holding_b)
			(not (handempty))
		)
	)
	(:action pickup_a
		:parameters ()
		:precondition
		(and 
			(clear_a)
			(ontable_a)
			(handempty))
		:effect
		(and 
			
			(not (clear_a))
			(not (ontable_a))
		)
	)
	(:action pickup_c
		:parameters ()
		:precondition
		(and 
			(clear_c)
			(handempty)
			(ontable_c))
		:effect
		(and 
			
			(not (clear_c))
			(not (ontable_c))
		)
	)
	(:action pickup_d
		:parameters ()
		:precondition
		(and 
			(ontable_d)
			(clear_d)
			(handempty))
		:effect
		(and 
			
			(not (ontable_d))
			(not (clear_d))
		)
	)
	(:action pickup_b
		:parameters ()
		:precondition
		(and 
			(clear_b)
			(ontable_b)
			(handempty))
		:effect
		(and 
			
			(not (clear_b))
			(not (ontable_b))
		)
	)
	(:action stack_a_a
		:parameters ()
		:precondition
		(and 
			(holding_a)
			(clear_a))
		:effect
		(and 
			(on_a_a)
			(handempty)
		)
	)
	(:action stack_a_c
		:parameters ()
		:precondition
		(and 
			(holding_a)
			(clear_c))
		:effect
		(and 
			(handempty)
			(on_a_c)
		)
	)
	(:action stack_a_d
		:parameters ()
		:precondition
		(and 
			(holding_a)
			(clear_d))
		:effect
		(and 
			(on_a_d)
			(handempty)
		)
	)
	(:action stack_a_b
		:parameters ()
		:precondition
		(and 
			(holding_a)
			(clear_b))
		:effect
		(and 
			(on_a_b)
			(handempty)
		)
	)
	(:action stack_c_a
		:parameters ()
		:precondition
		(and 
			(clear_a)
			(holding_c))
		:effect
		(and 
			(on_c_a)
			(handempty)
		)
	)
	(:action stack_c_c
		:parameters ()
		:precondition
		(and 
			(clear_c)
			(holding_c))
		:effect
		(and 
			(handempty)
			(on_c_c)
		)
	)
	(:action stack_c_d
		:parameters ()
		:precondition
		(and 
			(clear_d)
			(holding_c))
		:effect
		(and 
			(handempty)
			(on_c_d)
		)
	)
	(:action stack_c_b
		:parameters ()
		:precondition
		(and 
			(clear_b)
			(holding_c))
		:effect
		(and 
			(on_c_b)
			(handempty)
		)
	)
	(:action stack_d_a
		:parameters ()
		:precondition
		(and 
			(clear_a)
			(holding_d))
		:effect
		(and 
			(on_d_a)
			(handempty)
		)
	)
	(:action stack_d_c
		:parameters ()
		:precondition
		(and 
			(clear_c)
			(holding_d))
		:effect
		(and 
			(on_d_c)
			(handempty)
		)
	)
	(:action stack_d_d
		:parameters ()
		:precondition
		(and 
			(holding_d)
			(clear_d))
		:effect
		(and 
			(on_d_d)
			(handempty)
		)
	)
	(:action stack_d_b
		:parameters ()
		:precondition
		(and 
			(clear_b)
			(holding_d))
		:effect
		(and 
			(on_d_b)
			(handempty)
		)
	)
	(:action stack_b_a
		:parameters ()
		:precondition
		(and 
			(clear_a)
			(holding_b))
		:effect
		(and 
			(on_b_a)
			(handempty)
		)
	)
	(:action stack_b_c
		:parameters ()
		:precondition
		(and 
			(clear_c)
			(holding_b))
		:effect
		(and 
			(on_b_c)
			(handempty)
		)
	)
	(:action stack_b_d
		:parameters ()
		:precondition
		(and 
			(holding_b)
			(clear_d))
		:effect
		(and 
			(on_b_d)
			(handempty)
		)
	)
	(:action stack_b_b
		:parameters ()
		:precondition
		(and 
			(clear_b)
			(holding_b))
		:effect
		(and 
			(handempty)
			(on_b_b)
		)
	)
	(:action putdown_a
		:parameters ()
		:precondition
		(and 
			)
		:effect
		(and 
			(clear_a)
			(ontable_a)
		)
	)
	(:action putdown_c
		:parameters ()
		:precondition
		(and 
			)
		:effect
		(and 
			(clear_c)
			(ontable_c)
		)
	)
	(:action putdown_d
		:parameters ()
		:precondition
		(and 
			)
		:effect
		(and 
			(ontable_d)
			(clear_d)
		)
	)
	(:action putdown_b
		:parameters ()
		:precondition
		(and 
			)
		:effect
		(and 
			(clear_b)
			(ontable_b)
		)
	)
)