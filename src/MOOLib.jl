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

VERSION >= v"0.5.0" && __precompile__(true)

module MOOLib

using MOOFramework

#####################################################################
# Exporting APIs                                                    #
#####################################################################

export read_boap_hadi_instance, read_boap_hadi_non_dom_pts, read_boap_hadi, read_bokp_hadi_instance, read_bokp_hadi_non_dom_pts, read_bokp_hadi, read_bokp_xavier_instance, read_bokp_xavier_non_dom_pts, read_bokp_xavier1, read_bokp_xavier2, read_bokp_aritra_instance, read_boscp_xavier_instance, read_boscp_xavier_non_dom_pts, read_boscp_xavier, read_bospp_xavier_instance, read_bospp_xavier_non_dom_pts, read_bospp_xavier, read_bobpinstance, write_bobpinstance

#####################################################################
# Exporting Test Case Generators                                    #
#####################################################################

export generate_knapsack_instances, generate_bokp_instances

include("Api.jl")
include("Generating_Instances.jl")

end
