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
# Reading a Multi Objective Optimization Instance                   #
#####################################################################

function read_mooinstance(filename::AbstractString)
	lines_in_file::Vector{String} = readlines(filename)
	num_var::Int64 = 0
	if length(split(lines_in_file[1])) >= 6
		cont_var_ind::Vector{Int64} = [parse(Int64, split(lines_in_file[1])[i]) for i in 6:length(split(lines_in_file[1]))]
		num_var += length(cont_var_ind)
	end
	if length(split(lines_in_file[2])) >= 6
		bin_var_ind::Vector{Int64} = [parse(Int64, split(lines_in_file[2])[i]) for i in 6:length(split(lines_in_file[2]))]
		num_var += length(bin_var_ind)
	end
	if length(split(lines_in_file[3])) >= 6
		int_var_ind::Vector{Int64} = [parse(Int64, split(lines_in_file[3])[i]) for i in 6:length(split(lines_in_file[3]))]
		num_var += length(int_var_ind)
	end
	var_bounds::Array{Float64, 2} = zeros(num_var, 2)
	for i in 5:4+num_var
		var_bounds[i-4,:] = [float(split(lines_in_file[i])[j]) for j in 1:2]
	end
	obj_func_coeffs::Array{Float64, 2} = zeros(parse(Int64, split(lines_in_file[5+num_var])[6]), num_var)
	obj_sense::Vector{Int64} = ones(Int64, size(obj_func_coeffs)[1])
	count::Int64 = 6+num_var
	for i in 1:size(obj_func_coeffs)[1]
		tmp = split(lines_in_file[count])
		if tmp[1] == "maximize"
			obj_sense[i] = -1
		end
		obj_func_coeffs[i, :] = obj_sense[i]*[float(tmp[j]) for j in 2:num_var+1]
		count += 1
	end
	num_ineq_cons::Int64 = length(split(lines_in_file[count]))==6?parse(Int64, split(lines_in_file[count])[6]):0
	count += 1
	if num_ineq_cons == 0
		lhs_ineq_cons::Array{Float64, 2} = Array(Float64, 1, 1)
		rhs_ineq_cons::Vector{Float64} = Float64[]
	else
		lhs_ineq_cons = zeros(num_ineq_cons, num_var)
		rhs_ineq_cons = zeros(num_ineq_cons)
		for i in 1:num_ineq_cons
			tmp = split(lines_in_file[count])
			if tmp[end-1] == ">="
				lhs_ineq_cons[i, :] = [float(tmp[j]) for j in 1:length(tmp)-2]
				rhs_ineq_cons[i] = float(tmp[end])
			else
				lhs_ineq_cons[i, :] = -1*[float(tmp[j]) for j in 1:length(tmp)-2]
				rhs_ineq_cons[i] = -1*float(tmp[end])				
			end
			count += 1
		end
	end
	num_eq_cons::Int64 = length(split(lines_in_file[count]))==6?parse(Int64, split(lines_in_file[count])[6]):0
	count += 1
	if num_ineq_cons == 0
		lhs_eq_cons::Array{Float64, 2} = Array(Float64, 1, 1)
		rhs_eq_cons::Vector{Float64} = Float64[]
	else
		lhs_eq_cons = zeros(num_eq_cons, num_var)
		rhs_eq_cons = zeros(num_eq_cons)
		for i in 1:num_eq_cons
			tmp = split(lines_in_file[count])
			lhs_eq_cons[i, :] = [float(tmp[i]) for i in 1:length(tmp)-2]
			rhs_eq_cons[i] = float(tmp[end])
			count += 1
		end
	end
	(MOOInstance(collect(1:num_var), Int64[], Int64[], var_bounds, obj_func_coeffs, lhs_ineq_cons, rhs_ineq_cons, lhs_eq_cons, rhs_eq_cons), obj_sense)
end

"""
	read_bobpinstance(filename::AbstractString)
	
 Returns a `BOBPInstance` of a Bi Objective Binary Problem corresponding to `filename`
"""
function read_bobpinstance(filename::AbstractString)
	lines_in_file::Vector{String} = readlines(filename)
	c1::Vector{Float64}, c2::Vector{Float64} = Float64[], Float64[]
	obj_sense::Vector{Int64} = ones(Int64, 2)
	for i in 1:2
		tmp = split(lines_in_file[i])
		if tmp[1] == "maximize"
			obj_sense[i] = -1
		end
		if i == 1
			c1 = obj_sense[i]*[float(tmp[j]) for j in 2:length(tmp)]
		else
			c2 = obj_sense[i]*[float(tmp[j]) for j in 2:length(tmp)]
		end
	end
	m::Int64 = length(lines_in_file)-2
	A::Array{Float64, 2} = zeros(m, length(c1))
	cons_lb::Vector{Float64} = fill(-Inf, m)
	cons_ub::Vector{Float64} = fill(Inf, m)
	for i in 3:length(lines_in_file)
		tmp = split(lines_in_file[i])
		for j in 1:length(c1)
			A[i-2, j] = float(tmp[j])
		end
		if tmp[length(c1)+1] == "=="
			cons_lb[i-2] = float(tmp[length(c1)+2])
			cons_ub[i-2] = float(tmp[length(c1)+2])
		else
			if tmp[length(c1)+1] == ">="
				cons_lb[i-2] = float(tmp[length(c1)+2])
			else
				cons_ub[i-2] = float(tmp[length(c1)+2])
			end
		end
	end
	BOBPInstance(c1, c2, A, cons_lb, cons_ub)
end

global hadi_boap_instance_locations = Pkg.dir("MOOLib.jl/instances/BOAP/Hadi_Instances/instances/")
global hadi_boap_non_dom_sols_locations = Pkg.dir("MOOLib.jl/instances/BOAP/Hadi_Instances/non dominated points/")

"""
	read_boap_hadi_instance(filename::AbstractString)
	
 Returns a `BOBPInstance` of a Bi Objective Assignment Problem ( Hadi Instance ) corresponding to `filename`
"""
function read_boap_hadi_instance(filename::AbstractString)
	lines_in_file::Vector{String} = readlines(filename)
	n::Int64 = parse(Int64, lines_in_file[1])
	c1::Vector{Float64}, c2::Vector{Float64} = zeros(n^2), zeros(n^2)
	for i in 1:2
		tmp = split(lines_in_file[i+1])
		for j in 1:n^2
			if i == 1
				c1[j] = float(tmp[j])
			else
				c2[j] = float(tmp[j])
			end
		end
	end
	A::SparseMatrixCSC{Float64,Int64} = spzeros(2n, n^2)
	for i in 1:n
		A[i, n*(i-1)+1:n*i] = 1.0
	end
	for i in n+1:2n, j in 1:n
		A[i, n*(j-1)+i-n] = 1.0
	end
	BOBPInstance(c1, c2, A, ones(2n), ones(2n))
end

"""
	read_boap_hadi_non_dom_pts(filename::AbstractString)
	
 Returns True Non Dominated Points of a Bi Objective Assignment Problem ( Hadi Instance )
"""
function read_boap_hadi_non_dom_pts(filename::AbstractString)
	lines_in_file::Vector{String} = readlines(filename)
	tmp = [split(lines_in_file[i]) for i in 1:length(lines_in_file)]
	non_dom_sols::Array{Float64, 2} = zeros(length(lines_in_file), 2)
	for i in 1:length(tmp)
		if length(tmp[i]) > 0
			non_dom_sols[i, :] = collect([float(tmp[i][j]) for j in 1:length(tmp[i])])
		end
	end
	select_non_dom_sols(non_dom_sols)
end

"""
	read_boap_hadi(num::Int64)
	
 Returns a `BOBPInstance` of a Bi Objective Assignment Problem ( Hadi Instance ) and its corresponding True Non Dominated Points
"""
function read_boap_hadi(num::Int64=1)
	(read_boap_hadi_instance("$(hadi_boap_instance_locations)$(num)dat.txt"), read_boap_hadi_non_dom_pts("$(hadi_boap_non_dom_sols_locations)$(num)out.txt"))
end

global hadi_bokp_instance_locations = Pkg.dir("MOOLib.jl/instances/BOKP/Hadi_Instances/instances/")
global hadi_bokp_non_dom_sols_locations = Pkg.dir("MOOLib.jl/instances/BOKP/Hadi_Instances/non dominated points/")

"""
	read_bokp_hadi_instance(filename::AbstractString)
	
 Returns a `BOBPInstance` of a Bi Objective Knapsack Problem ( Hadi Instance ) corresponding to `filename`
"""
function read_bokp_hadi_instance(filename::AbstractString)
	lines_in_file::Vector{String} = readlines(filename)
	n::Int64 = parse(Int64, lines_in_file[1])
	tmp::Vector{String} = split(lines_in_file[4])
	c1::Vector{Float64} = collect([parse(Int64,tmp[i]) for i in 1:length(tmp)])
	tmp = split(lines_in_file[5])
	c2::Vector{Float64} = collect([parse(Int64,tmp[i]) for i in 1:length(tmp)])
	A::Array{Float64, 2} = zeros(2, n)
	tmp = split(lines_in_file[6])
	A[1, :] = -1*collect([parse(Int64,tmp[i]) for i in 1:length(tmp)])
	tmp = split(lines_in_file[7])
	A[2, :] = -1*collect([parse(Int64,tmp[i]) for i in 1:length(tmp)])
	cons_lb::Vector{Float64} = -1*[float(lines_in_file[2]), float(lines_in_file[3])]
	BOBPInstance(c1, c2, A, cons_lb, fill(Inf, 2))
end

"""
	read_bokp_hadi_non_dom_pts(filename::AbstractString)
	
 Returns True Non Dominated Points of a Bi Objective Knapsack Problem ( Hadi Instance )
"""
function read_bokp_hadi_non_dom_pts(filename::AbstractString)
	lines_in_file::Vector{String} = readlines(filename)
	tmp = [split(lines_in_file[i]) for i in 1:length(lines_in_file)-1]
	non_dom_sols::Array{Float64, 2} = zeros(length(lines_in_file)-1, 2)
	for i in 1:length(tmp)
		if length(tmp[i]) > 0
			non_dom_sols[i, :] = collect([float(tmp[i][j]) for j in 1:length(tmp[i])])
		end
	end
	select_non_dom_sols(-1*non_dom_sols)
end

"""
	read_bokp_hadi(num::Int64)
	
 Returns a `BOBPInstance` of a Bi Objective Knapsack Problem ( Hadi Instance ) and its corresponding True Non Dominated Points
"""
function read_bokp_hadi(num::Int64=1)
	(read_bokp_hadi_instance("$(hadi_bokp_instance_locations)$(num)dat.txt"), read_bokp_hadi_non_dom_pts("$(hadi_bokp_non_dom_sols_locations)$(num)out.txt"))
end

global xavier_bokp_instance_locations = Pkg.dir("MOOLib.jl/instances/BOKP/Xavier_Instances/instances/")
global xavier_bokp_non_dom_sols_locations = Pkg.dir("MOOLib.jl/instances/BOKP/Xavier_Instances/non dominated points/")

"""
	read_bokp_xavier_instance1(filename::AbstractString)
	
 Returns a `BOBPInstance` of a Bi Objective Knapsack Problem ( Xavier Class 1 Instances ) corresponding to `filename`.
"""
function read_bokp_xavier_instance1(filename::AbstractString)
	lines_in_file::Vector{String} = readlines(filename)
	n::Int64 = 0
	try
		n = parse(Int64, split(lines_in_file[1])[end])
	catch
		n = parse(Int64, lines_in_file[4])
	end
	m::Int64 = 1
	coeffs::Array{Float64, 2} = zeros(3, n)
	pos1::Int64, pos2::Int64 = 1, 1
	i::Int64 = 1
	while i <= length(lines_in_file)
		if contains(lines_in_file[i], "Objectif") || contains(lines_in_file[i], "Contrainte")
			i += 1
			pos2 = 1
			while pos2 <= n
				tmp = split(lines_in_file[i])
				if length(tmp) >= 1
					coeffs[pos1, pos2] = float(tmp[1])
					pos2 += 1
				end
				i += 1
			end
			pos1 += 1
		else
			i += 1
		end
	end
	BOBPInstance(-1vec(coeffs[1, :]), -1vec(coeffs[2, :]), -1coeffs[3:end, :], [-1float(split(lines_in_file[end])[1])], [Inf])
end

"""
	read_bokp_xavier_instance2(filename::AbstractString)
	
 Returns a `BOBPInstance` of a Bi Objective Knapsack Problem ( Xavier Class 1 Instances ) corresponding to `filename`.
"""
function read_bokp_xavier_instance2(filename::AbstractString)
	n::Int64 = 0
	W::Float64 = 0.0
	lines_in_file::Vector{String} = readlines(filename)
	for i in 1:length(lines_in_file)
    	if lines_in_file[i][1] == 'n'
        	n = parse(Int64,split(lines_in_file[i])[2])
        	break
    	end 
	end
	coeffs::Array{Float64, 2} = zeros(n, 3)
	count::Int64 = 1
	for i in 1:length(lines_in_file)
    	if lines_in_file[i][1] == 'i'
    	    tmp = split(lines_in_file[i])[2:end]
    	    coeffs[count, :] = [parse(Int64,tmp[i]) for i in 1:3]
    	    count += 1
    	end 
    	if lines_in_file[i][1] == 'W'
    	    W = float(split(lines_in_file[i])[2]) 
    	end
	end
	BOBPInstance(-1vec(coeffs[:,2]), -1vec(coeffs[:, 3]), -1coeffs[:, 1]', [-1W], [Inf])
end

"""
	read_bokp_xavier_non_dom_pts(filename::AbstractString)
	
 Returns True Non Dominated Points of a Bi Objective Knapsack Problem ( Xavier Instance )
"""
function read_bokp_xavier_non_dom_pts(filename::AbstractString)
	lines_in_file::Vector{String} = readlines(filename)
	tmp = [split(lines_in_file[i]) for i in 1:length(lines_in_file)]
	non_dom_sols::Array{Float64, 2} = zeros(length(lines_in_file), 2)
	for i in 1:length(tmp)
		if length(tmp[i]) > 0
			non_dom_sols[i, :] = collect([float(tmp[i][j]) for j in 1:2])
		end
	end
	select_non_dom_sols(-1*non_dom_sols)
end

"""
	read_bokp_xavier1(name::String)
	
 Returns a `BOBPInstance` of a Bi Objective Knapsack Problem ( Xavier Class 1 Instance ) and its corresponding True Non Dominated Points
"""
function read_bokp_xavier1(name::String)
	try
		(read_bokp_xavier_instance1("$(xavier_bokp_instance_locations)$(name).dat"), read_bokp_xavier_non_dom_pts("$(xavier_bokp_non_dom_sols_locations)$(name).max"))
	catch
		(read_bokp_xavier_instance1("$(xavier_bokp_instance_locations)$(name).DAT"), read_bokp_xavier_non_dom_pts("$(xavier_bokp_non_dom_sols_locations)$(name).max"))
	end
end

"""
	read_bokp_xavier2(name::String)
	
 Returns a `BOBPInstance` of a Bi Objective Knapsack Problem ( Xavier Class 2 Instance ) and its corresponding True Non Dominated Points
"""
function read_bokp_xavier2(name::String)
	(read_bokp_xavier_instance2("$(xavier_bokp_instance_locations)$(name).KNP"), read_bokp_xavier_non_dom_pts("$(xavier_bokp_non_dom_sols_locations)$(name).max"))
end

global aritra_bokp_instance_locations = Pkg.dir("MOOLib.jl/instances/BOKP/Aritra_Instances/")

"""
	read_bokp_aritra_instance(n::Int64, m::Int64, instance::Int64)
	
 Returns a `BOBPInstance` of a Bi Objective Knapsack Problem ( Aritra Instances ) corresponding to `n`, `m` and `instance`.
"""
function read_bokp_aritra_instance(n::Int64, m::Int64, instance::Int64)
	read_bobpinstance("$(aritra_bokp_instance_locations)2_$(n)_$(m)_$(instance).txt")
end

#####################################################################
# Reading a Bi Objective Set Covering Problem Instance              #
# Xavier Instances                                                  #
#####################################################################

global xavier_boscp_instance_locations = Pkg.dir("MOOLib.jl/instances/BOSCP/Xavier_Instances/")
global xavier_boscp_non_dom_sols_locations = Pkg.dir("MOOLib.jl/instances/BOSCP/Xavier_Instances/")

"""
	read_boscp_xavier_instance(n::Int64, m::Int64, instance)
	
 Returns a `BOBPInstance` of a Bi Objective Set Covering Problem ( Xavier Instance ) corresponding to `n`, `m` and `instance`.
"""
function read_boscp_xavier_instance(n::Int64, m::Int64, instance)
	filename1::String = "$(xavier_boscp_instance_locations)SCP$(m)x$(n)/testp1_$(lowercase(instance)).lp"
	lines_in_file::Vector{String} = readlines(filename1)
	c1::Vector{Float64} = -1[float(split(lines_in_file[2])[2i]) for i in 1:n]
	A::SparseMatrixCSC{Float64,Int64} = spzeros(m, n)
	for i in 1:m
		tmp = split(lines_in_file[4+i])[2:end-4]
		A[i, :] = [float(tmp[2j-1]) for j in 1:n]
	end
	filename2::String = "$(xavier_boscp_instance_locations)SCP$(m)x$(n)/testp2_$(lowercase(instance)).lp"
	lines_in_file = readlines(filename2)
	c2::Vector{Float64} = -1[float(split(lines_in_file[2])[2i]) for i in 1:n]
	BOBPInstance(c1, c2, A, fill(1.0, m), fill(Inf, m))
end

"""
	read_boscp_xavier_non_dom_pts(filename::AbstractString)
	
 Returns True Non Dominated Points of a Bi Objective Set Covering Problem ( Xavier Instance )
"""
function read_boscp_xavier_non_dom_pts(filename::AbstractString)
	lines_in_file::Vector{String} = readlines(filename)
	tmp = [split(lines_in_file[i]) for i in 1:length(lines_in_file)]
	non_dom_sols::Array{Float64, 2} = zeros(length(lines_in_file), 2)
	for i in 1:length(tmp)
		if length(tmp[i]) > 0
			non_dom_sols[i, :] = collect([float(tmp[i][j]) for j in 1:length(tmp[i])])
		end
	end
	select_non_dom_sols(-1*non_dom_sols)
end

"""
	read_boscp_xavier(n::Int64, m::Int64, instance::Int64)
	
 Returns a `BOBPInstance` of a Bi Objective Set Covering Problem ( Xavier Instance ) and its corresponding True Non Dominated Points.
"""
function read_boscp_xavier(n::Int64, m::Int64, instance)
	(read_boscp_xavier_instance(n, m, instance), read_boscp_xavier_non_dom_pts("$(xavier_boscp_non_dom_sols_locations)SCP$(m)x$(n)/Pareto_$(lowercase(instance)).txt"))
end

#####################################################################
# Reading a Bi Objective Set Packing Problem Instance               #
# Xavier Instances                                                  #
#####################################################################

global xavier_bospp_instance_locations = Pkg.dir("MOOLib.jl/instances/BOSPP/Xavier_Instances/instances/")
global xavier_bospp_non_dom_sols_locations = Pkg.dir("MOOLib.jl/instances/BOSPP/Xavier_Instances/non dominated points/")

"""
	read_bospp_xavier_instance(filename::AbstractString)
	
 Returns a `BOBPInstance` of a Bi Objective Set Packing Problem ( Xavier Instance ) corresponding to `filename`.
"""
function read_bospp_xavier_instance(filename::AbstractString)
	lines_in_file::Vector{String} = readlines(filename)
	m::Int64, n::Int64 = [parse(Int64, split(lines_in_file[1])[i]) for i in 1:2]
	c1::Vector{Float64} = -1[parse(Int64,split(lines_in_file[2])[i]) for i in 1:n]
	c2::Vector{Float64} = -1[parse(Int64,split(lines_in_file[3])[i]) for i in 1:n]
    A::SparseMatrixCSC{Float64,Int64} = spzeros(m, n)
	pos::Int64 = 1
	for i in 4:3+2m
		if i%2 == 0
			continue
		end
		tmp = split(lines_in_file[i])
		A[pos,[parse(Int64, tmp[j]) for j in 1:length(tmp)]] = -1.0
		pos += 1
	end
	BOBPInstance(c1, c2, A, fill(-1.0, m), fill(Inf, m))
end

"""
	read_bospp_xavier_non_dom_pts(filename::AbstractString)
	
 Returns True Non Dominated Points of a Bi Objective Set Packing Problem ( Xavier Instance )
"""
function read_bospp_xavier_non_dom_pts(filename::AbstractString)
	lines_in_file::Vector{String} = readlines(filename)
	tmp = [split(lines_in_file[i]) for i in 1:length(lines_in_file)]
	non_dom_sols::Array{Float64, 2} = zeros(length(lines_in_file), 2)
	for i in 1:length(tmp)
		if length(tmp[i]) > 0
			non_dom_sols[i, :] = collect([float(tmp[i][j]) for j in 1:length(tmp[i])])
		end
	end
	select_non_dom_sols(-1*non_dom_sols)
end

"""
	read_bospp_xavier(instance_id::String)
	
 Returns a `BOBPInstance` of a Bi Objective Set Packing Problem ( Xavier Instance ) and its corresponding True Non Dominated Points.
"""
function read_bospp_xavier(instance_id::String)
	(read_bospp_xavier_instance("$(xavier_bospp_instance_locations)$(instance_id).dat"), read_bospp_xavier_non_dom_pts("$(xavier_bospp_non_dom_sols_locations)$(instance_id).01"))
end

#####################################################################
# Writing a Multi Objective Optimization Instance                   #
#####################################################################

function write_mooinstance(instance::MOOInstance, filename::AbstractString)
	file = open(filename, "w")
	write(file, "Index of Continuous Variables = ")
	for i in 1:length(instance.cont_var_ind)
		if i != instance.cont_var_ind
			write(file, "$(instance.cont_var_ind[i]) ")
		else
			write(file, "$(instance.cont_var_ind[i])")
		end
	end
	write(file, "\nIndex of Binary Variables = ")
	for i in 1:length(instance.bin_var_ind)
		if i != instance.bin_var_ind
			write(file, "$(instance.bin_var_ind[i]) ")
		else
			write(file, "$(instance.bin_var_ind[i])")
		end
	end
	write(file, "\nIndex of Integer Variables = ")
	for i in 1:length(instance.int_var_ind)
		if i != instance.int_var_ind
			write(file, "$(instance.int_var_ind[i]) ")
		else
			write(file, "$(instance.int_var_ind[i])")
		end
	end
	write(file, "\nBound of Variables = \n")
	for i in 1:size(instance.obj_func_coeffs)[2]
		write(file, "$(instance.var_bounds[i, 1]) ")
		write(file, "$(instance.var_bounds[i, 2])\n")
	end
	write(file, "Number of Objective Functions = $(size(instance.obj_func_coeffs)[1])\n")
	for i in 1:size(instance.obj_func_coeffs)[1]
		write(file, "minimize ")
		for j in 1:size(instance.obj_func_coeffs)[2]
			write(file, "$(instance.obj_func_coeffs[i, j]) ")
		end
		write(file, "\n")
	end
	if size(instance.lhs_ineq_cons)[2] == size(instance.obj_func_coeffs)[2]
		write(file, "Number of Inequality Constraints = $(size(instance.lhs_ineq_cons)[1])\n")
		for i in 1:size(instance.lhs_ineq_cons)[1]
			for j in 1:size(instance.lhs_ineq_cons)[2]
				write(file, "$(instance.lhs_ineq_cons[i, j]) ")
			end
			write(file, ">= $(instance.rhs_ineq_cons[i])\n")
		end
	end
	if size(instance.lhs_eq_cons)[2] == size(instance.obj_func_coeffs)[2]
		write(file, "Number of Equality Constraints = $(size(instance.lhs_eq_cons)[1])\n")
		for i in 1:size(instance.lhs_eq_cons)[1]
			for j in 1:size(instance.lhs_eq_cons)[2]
				write(file, "$(instance.lhs_eq_cons[i, j]) ")
			end
			write(file, "== $(instance.rhs_eq_cons[i])\n")
		end
	end
	close(file)
end

#####################################################################
# Writing a Biobjective Binary Program                              #
#####################################################################

"""
	write_bobpinstance(instance::BOBPInstance, filename::AbstractString)
	
 Writing a `BOBPInstance` to `filename`.
"""
function write_bobpinstance(instance::BOBPInstance, filename::AbstractString)
	file = open(filename, "w")
	write(file, "minimize ")
	for i in 1:length(instance.c1)
		write(file, "$(instance.c1[i]) ")
	end
	write(file, "\n")
	write(file, "minimize ")
	for i in 1:length(instance.c2)
		write(file, "$(instance.c2[i]) ")
	end
	write(file, "\n")
	for i in 1:size(instance.A)[1]
		for j in 1:length(instance.c1)
			write(file, "$(instance.A[i, j]) ")
		end
		if instance.cons_lb[i] == instance.cons_ub[i]
			write(file, "== $(instance.cons_lb[i])\n")
		else
			if instance.cons_lb[i] == -Inf
				write(file, "<= $(instance.cons_ub[i])\n")
			else
				write(file, ">= $(instance.cons_lb[i])\n")
			end	
		end
	end
	close(file)
end
