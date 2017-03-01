# Multi-Objective Optimization Instances Library in Julia #

This library is a collection of instances and their true non dominated frontiers ( if available ) of various classes of Multi Objective Optimization problem instances, especially pure and mixed integer program. The instances are returned as a `MOOInstance` or a `BOOInstance`.

As `MOOFramework.jl` can only handle instances of the form:
$\begin{align}
\text{min } & c x \\
\text{s.t. } & A x \geq b \\
& G x = H
\end{align}$. All instances and their true non dominated frontiers ( if available ) are also returned in this form.
