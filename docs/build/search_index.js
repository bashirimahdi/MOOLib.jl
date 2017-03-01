var documenterSearchIndex = {"docs": [

{
    "location": "index.html#",
    "page": "Home",
    "title": "Home",
    "category": "page",
    "text": ""
},

{
    "location": "index.html#Multi-Objective-Optimization-Instances-Library-in-Julia-1",
    "page": "Home",
    "title": "Multi-Objective Optimization Instances Library in Julia",
    "category": "section",
    "text": "This library is a collection of instances and their true non dominated frontiers ( if available ) of various classes of Multi Objective Optimization problem instances, especially pure and mixed integer program. The instances are returned as a MOOInstance or a BOOInstance.As MOOFramework.jl can only handle instances of the form: beginalign textmin   c x \ntextst   A x geq b \n G x = H endalign. All instances and their true non dominated frontiers ( if available ) are also returned in this form."
},

{
    "location": "api.html#",
    "page": "Reading and Writing Instances",
    "title": "Reading and Writing Instances",
    "category": "page",
    "text": ""
},

{
    "location": "api.html#Reading-and-Writing-Instances-1",
    "page": "Reading and Writing Instances",
    "title": "Reading and Writing Instances",
    "category": "section",
    "text": ""
},

{
    "location": "api.html#MOOLib.read_bobpinstance-Tuple{AbstractString}",
    "page": "Reading and Writing Instances",
    "title": "MOOLib.read_bobpinstance",
    "category": "Method",
    "text": "read_bobpinstance(filename::AbstractString)\n\nReturns a BOBPInstance of a Bi Objective Binary Problem corresponding to filename\n\n\n\n"
},

{
    "location": "api.html#MOOLib.write_bobpinstance-Tuple{MOOFramework.BOBPInstance,AbstractString}",
    "page": "Reading and Writing Instances",
    "title": "MOOLib.write_bobpinstance",
    "category": "Method",
    "text": "write_bobpinstance(instance::BOBPInstance, filename::AbstractString)\n\nWriting a BOBPInstance to filename.\n\n\n\n"
},

{
    "location": "api.html#Biobjective-Binary-Programs-1",
    "page": "Reading and Writing Instances",
    "title": "Biobjective Binary Programs",
    "category": "section",
    "text": "read_bobpinstance(filename::AbstractString)write_bobpinstance(instance::BOBPInstance, filename::AbstractString)"
},

{
    "location": "bobp.html#",
    "page": "Biobjective Binary Programs",
    "title": "Biobjective Binary Programs",
    "category": "page",
    "text": ""
},

{
    "location": "bobp.html#Biobjective-Binary-Programs-1",
    "page": "Biobjective Binary Programs",
    "title": "Biobjective Binary Programs",
    "category": "section",
    "text": ""
},

{
    "location": "bobp.html#MOOLib.read_boap_hadi_instance-Tuple{AbstractString}",
    "page": "Biobjective Binary Programs",
    "title": "MOOLib.read_boap_hadi_instance",
    "category": "Method",
    "text": "read_boap_hadi_instance(filename::AbstractString)\n\nReturns a BOBPInstance of a Bi Objective Assignment Problem ( Hadi Instance ) corresponding to filename\n\n\n\n"
},

{
    "location": "bobp.html#MOOLib.read_boap_hadi_non_dom_pts-Tuple{AbstractString}",
    "page": "Biobjective Binary Programs",
    "title": "MOOLib.read_boap_hadi_non_dom_pts",
    "category": "Method",
    "text": "read_boap_hadi_non_dom_pts(filename::AbstractString)\n\nReturns True Non Dominated Points of a Bi Objective Assignment Problem ( Hadi Instance )\n\n\n\n"
},

{
    "location": "bobp.html#MOOLib.read_boap_hadi-Tuple{Int64}",
    "page": "Biobjective Binary Programs",
    "title": "MOOLib.read_boap_hadi",
    "category": "Method",
    "text": "read_boap_hadi(num::Int64)\n\nReturns a BOBPInstance of a Bi Objective Assignment Problem ( Hadi Instance ) and its corresponding True Non Dominated Points\n\n\n\n"
},

{
    "location": "bobp.html#Biobjective-Assignment-Problems-(BOAP)-1",
    "page": "Biobjective Binary Programs",
    "title": "Biobjective Assignment Problems (BOAP)",
    "category": "section",
    "text": "read_boap_hadi_instance(filename::AbstractString)read_boap_hadi_non_dom_pts(filename::AbstractString)read_boap_hadi(num::Int64)"
},

{
    "location": "bobp.html#MOOLib.read_bokp_hadi_instance-Tuple{AbstractString}",
    "page": "Biobjective Binary Programs",
    "title": "MOOLib.read_bokp_hadi_instance",
    "category": "Method",
    "text": "read_bokp_hadi_instance(filename::AbstractString)\n\nReturns a BOBPInstance of a Bi Objective Knapsack Problem ( Hadi Instance ) corresponding to filename\n\n\n\n"
},

{
    "location": "bobp.html#MOOLib.read_bokp_hadi_non_dom_pts-Tuple{AbstractString}",
    "page": "Biobjective Binary Programs",
    "title": "MOOLib.read_bokp_hadi_non_dom_pts",
    "category": "Method",
    "text": "read_bokp_hadi_non_dom_pts(filename::AbstractString)\n\nReturns True Non Dominated Points of a Bi Objective Knapsack Problem ( Hadi Instance )\n\n\n\n"
},

{
    "location": "bobp.html#MOOLib.read_bokp_hadi-Tuple{Int64}",
    "page": "Biobjective Binary Programs",
    "title": "MOOLib.read_bokp_hadi",
    "category": "Method",
    "text": "read_bokp_hadi(num::Int64)\n\nReturns a BOBPInstance of a Bi Objective Knapsack Problem ( Hadi Instance ) and its corresponding True Non Dominated Points\n\n\n\n"
},

{
    "location": "bobp.html#MOOLib.read_bokp_xavier_non_dom_pts-Tuple{AbstractString}",
    "page": "Biobjective Binary Programs",
    "title": "MOOLib.read_bokp_xavier_non_dom_pts",
    "category": "Method",
    "text": "read_bokp_xavier_non_dom_pts(filename::AbstractString)\n\nReturns True Non Dominated Points of a Bi Objective Knapsack Problem ( Xavier Instance )\n\n\n\n"
},

{
    "location": "bobp.html#MOOLib.read_bokp_xavier1-Tuple{String}",
    "page": "Biobjective Binary Programs",
    "title": "MOOLib.read_bokp_xavier1",
    "category": "Method",
    "text": "read_bokp_xavier1(name::String)\n\nReturns a BOBPInstance of a Bi Objective Knapsack Problem ( Xavier Class 1 Instance ) and its corresponding True Non Dominated Points\n\n\n\n"
},

{
    "location": "bobp.html#MOOLib.read_bokp_xavier2-Tuple{String}",
    "page": "Biobjective Binary Programs",
    "title": "MOOLib.read_bokp_xavier2",
    "category": "Method",
    "text": "read_bokp_xavier2(name::String)\n\nReturns a BOBPInstance of a Bi Objective Knapsack Problem ( Xavier Class 2 Instance ) and its corresponding True Non Dominated Points\n\n\n\n"
},

{
    "location": "bobp.html#Biobjective-Knapsack-Problems-(BOKP)-1",
    "page": "Biobjective Binary Programs",
    "title": "Biobjective Knapsack Problems (BOKP)",
    "category": "section",
    "text": "read_bokp_hadi_instance(filename::AbstractString)read_bokp_hadi_non_dom_pts(filename::AbstractString)read_bokp_hadi(num::Int64)read_bokp_xavier_instance1(filename::AbstractString)read_bokp_xavier_instance2(filename::AbstractString)read_bokp_xavier_non_dom_pts(filename::AbstractString)read_bokp_xavier1(name::String)read_bokp_xavier2(name::String)"
},

{
    "location": "bobp.html#MOOLib.read_boscp_xavier_instance-Tuple{Int64,Int64,Any}",
    "page": "Biobjective Binary Programs",
    "title": "MOOLib.read_boscp_xavier_instance",
    "category": "Method",
    "text": "read_boscp_xavier_instance(n::Int64, m::Int64, instance)\n\nReturns a BOBPInstance of a Bi Objective Set Covering Problem ( Xavier Instance ) corresponding to n, m and instance.\n\n\n\n"
},

{
    "location": "bobp.html#MOOLib.read_boscp_xavier_non_dom_pts-Tuple{AbstractString}",
    "page": "Biobjective Binary Programs",
    "title": "MOOLib.read_boscp_xavier_non_dom_pts",
    "category": "Method",
    "text": "read_boscp_xavier_non_dom_pts(filename::AbstractString)\n\nReturns True Non Dominated Points of a Bi Objective Set Covering Problem ( Xavier Instance )\n\n\n\n"
},

{
    "location": "bobp.html#MOOLib.read_boscp_xavier-Tuple{Int64,Int64,Int64}",
    "page": "Biobjective Binary Programs",
    "title": "MOOLib.read_boscp_xavier",
    "category": "Method",
    "text": "read_boscp_xavier(n::Int64, m::Int64, instance::Int64)\n\nReturns a BOBPInstance of a Bi Objective Set Covering Problem ( Xavier Instance ) and its corresponding True Non Dominated Points.\n\n\n\n"
},

{
    "location": "bobp.html#Biobjective-Set-Covering-Problems-(BOSCP)-1",
    "page": "Biobjective Binary Programs",
    "title": "Biobjective Set Covering Problems (BOSCP)",
    "category": "section",
    "text": "read_boscp_xavier_instance(n::Int64, m::Int64, instance)read_boscp_xavier_non_dom_pts(filename::AbstractString)read_boscp_xavier(n::Int64, m::Int64, instance::Int64)"
},

{
    "location": "bobp.html#MOOLib.read_bospp_xavier_instance-Tuple{AbstractString}",
    "page": "Biobjective Binary Programs",
    "title": "MOOLib.read_bospp_xavier_instance",
    "category": "Method",
    "text": "read_bospp_xavier_instance(filename::AbstractString)\n\nReturns a BOBPInstance of a Bi Objective Set Packing Problem ( Xavier Instance ) corresponding to filename.\n\n\n\n"
},

{
    "location": "bobp.html#MOOLib.read_bospp_xavier_non_dom_pts-Tuple{AbstractString}",
    "page": "Biobjective Binary Programs",
    "title": "MOOLib.read_bospp_xavier_non_dom_pts",
    "category": "Method",
    "text": "read_bospp_xavier_non_dom_pts(filename::AbstractString)\n\nReturns True Non Dominated Points of a Bi Objective Set Packing Problem ( Xavier Instance )\n\n\n\n"
},

{
    "location": "bobp.html#MOOLib.read_bospp_xavier-Tuple{String}",
    "page": "Biobjective Binary Programs",
    "title": "MOOLib.read_bospp_xavier",
    "category": "Method",
    "text": "read_bospp_xavier(instance_id::String)\n\nReturns a BOBPInstance of a Bi Objective Set Packing Problem ( Xavier Instance ) and its corresponding True Non Dominated Points.\n\n\n\n"
},

{
    "location": "bobp.html#Biobjective-Set-Packing-Problems-(BOSPP)-1",
    "page": "Biobjective Binary Programs",
    "title": "Biobjective Set Packing Problems (BOSPP)",
    "category": "section",
    "text": "read_bospp_xavier_instance(filename::AbstractString)read_bospp_xavier_non_dom_pts(filename::AbstractString)read_bospp_xavier(instance_id::String)"
},

{
    "location": "bobp.html#MOOLib.read_bokp_aritra_instance-Tuple{Int64,Int64,Int64}",
    "page": "Biobjective Binary Programs",
    "title": "MOOLib.read_bokp_aritra_instance",
    "category": "Method",
    "text": "read_bokp_aritra_instance(n::Int64, m::Int64, instance::Int64)\n\nReturns a BOBPInstance of a Bi Objective Knapsack Problem ( Aritra Instances ) corresponding to n, m and instance.\n\n\n\n"
},

{
    "location": "bobp.html#Biobjective-Multi-Dimensional-Knapsack-Problems-(BOKP)-1",
    "page": "Biobjective Binary Programs",
    "title": "Biobjective Multi Dimensional Knapsack Problems (BOKP)",
    "category": "section",
    "text": "For this set of instances, the true non dominated frontier is not available.read_bokp_aritra_instance(n::Int64, m::Int64, instance::Int64)"
},

{
    "location": "random.html#",
    "page": "Random Instance Generators",
    "title": "Random Instance Generators",
    "category": "page",
    "text": ""
},

{
    "location": "random.html#Random-Instance-Generators-1",
    "page": "Random Instance Generators",
    "title": "Random Instance Generators",
    "category": "section",
    "text": ""
},

{
    "location": "random.html#MOOLib.generate_bokp_instances-Tuple{Int64,Int64,Bool}",
    "page": "Random Instance Generators",
    "title": "MOOLib.generate_bokp_instances",
    "category": "Method",
    "text": "generate_bokp_instances(num_var::Int64, num_cons::Int64, sparse::Bool)\n\nReturns a BOBPInstance of a random Bi Objective Knapsack Problem with num_var binary variables and num_cons inequality constraints.\n\n\n\n"
},

{
    "location": "random.html#Biobjective-Multi-Dimensional-Knapsack-Problems-1",
    "page": "Random Instance Generators",
    "title": "Biobjective Multi Dimensional Knapsack Problems",
    "category": "section",
    "text": "generate_bokp_instances(num_var::Int64, num_cons::Int64, sparse::Bool)"
},

]}
