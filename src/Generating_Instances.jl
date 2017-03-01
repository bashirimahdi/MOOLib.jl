###############################################################################
#                                                                             #
#  This file is part of the julia module for Multi Objective Optimization     #
#  (c) Copyright 2017 by Aritra Pal, Hadi Charkhgard                          #
#                                                                             #
#  Permission is granted for academic research use.  For other uses,          #
#  contact the authors for licensing options.                                 #
#                                                                             #
#  Use at your own risk. I make no guarantees about the correctness or        #          
#  usefulness of this code.                                                   #
#                                                                             #
###############################################################################

#####################################################################
# Multi-Objective Multi-Dimensional 0-1 Knapsack Problem            #
#####################################################################

@inbounds function generate_knapsack_instances(num_obj::Int64=2, num_var::Int64=10, num_cons::Int64=1, sparse::Bool=true)
	obj_func_coeffs::Array{Int64,2} = -1*rand(1:100, num_obj, num_var)
	if sparse
		lhs_ineq_cons::Array{Int64,2} = -1*rand(0:100, num_cons, num_var)
	else
		lhs_ineq_cons = -1*rand(1:100, num_cons, num_var)
	end
	rhs_ineq_cons::Vector{Int64} = collect([-1*floor(Int64, sum(lhs_ineq_cons[i,:])/2) for i in 1:num_cons])
	var_bounds::Array{Int64, 2} = zeros(Int64, num_var, 2)
	var_bounds[:, 2] = fill(1, num_var)
	return MOOInstance(Int64[], collect(1:num_var), Int64[], var_bounds, obj_func_coeffs, lhs_ineq_cons, rhs_ineq_cons, Array(Int64, 1, 1), Int64[])
end

"""
	generate_bokp_instances(num_var::Int64, num_cons::Int64, sparse::Bool)
	
 Returns a `BOBPInstance` of a random Bi Objective Knapsack Problem with `num_var` binary variables and `num_cons` inequality constraints.
"""
function generate_bokp_instances(num_var::Int64, num_cons::Int64, sparse::Bool)
	if sparse
		A::Array{Int64,2} = rand(0:100, num_cons, num_var)
	else
		A = rand(1:100, num_cons, num_var)
	end
	return BOBPInstance(-1*rand(1:100, num_var), -1*rand(1:100, num_var), -1*A, -1*collect([floor(Int64, sum(A[i,:])/2) for i in 1:num_cons]), fill(Inf, num_cons))
end
