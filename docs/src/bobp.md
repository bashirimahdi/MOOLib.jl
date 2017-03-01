# Biobjective Binary Programs #

## Biobjective Assignment Problems (BOAP) ##

```@docs
read_boap_hadi_instance(filename::AbstractString)
```

```@docs
read_boap_hadi_non_dom_pts(filename::AbstractString)
```

```@docs
read_boap_hadi(num::Int64)
```

## Biobjective Knapsack Problems (BOKP) ##

```@docs
read_bokp_hadi_instance(filename::AbstractString)
```

```@docs
read_bokp_hadi_non_dom_pts(filename::AbstractString)
```

```@docs
read_bokp_hadi(num::Int64)
```

```@docs
read_bokp_xavier_instance1(filename::AbstractString)
```

```@docs
read_bokp_xavier_instance2(filename::AbstractString)
```

```@docs
read_bokp_xavier_non_dom_pts(filename::AbstractString)
```

```@docs
read_bokp_xavier1(name::String)
```

```@docs
read_bokp_xavier2(name::String)
```

## Biobjective Set Covering Problems (BOSCP) ##

```@docs
read_boscp_xavier_instance(n::Int64, m::Int64, instance)
```

```@docs
read_boscp_xavier_non_dom_pts(filename::AbstractString)
```

```@docs
read_boscp_xavier(n::Int64, m::Int64, instance::Int64)
```

## Biobjective Set Packing Problems (BOSPP) ##

```@docs
read_bospp_xavier_instance(filename::AbstractString)
```

```@docs
read_bospp_xavier_non_dom_pts(filename::AbstractString)
```

```@docs
read_bospp_xavier(instance_id::String)
```

## Biobjective Multi Dimensional Knapsack Problems (BOKP) ##

For this set of instances, the true non dominated frontier is not available.

```@docs
read_bokp_aritra_instance(n::Int64, m::Int64, instance::Int64)
```
