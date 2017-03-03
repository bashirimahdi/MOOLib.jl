# Multi-Objective Optimization Instances Library in Julia #

This library is a collection of instances and their true non dominated frontiers ( if available ) of various classes of Multi Objective Optimization problem instances, especially pure and mixed integer program. The instances are returned as a `MOOInstance` or a `BOOInstance`.

As `MOOFramework.jl` can only handle instances of the form:
$\begin{align*}
\text{min } & c x \\
\text{s.t. } & A x \geq b \\
& G x = H
\end{align*}$. All instances and their true non dominated frontiers ( if available ) are also returned in this form.

## Important Note about the Instances ##

*Most of these instances are taken from different sources. We have uploaded these instances here to make life easier for users by giving them an easier access. However, it is the responsibility of all users to refer to the original website and follow the rules (or any license) defined by the (true) owners of these instances.* The details of the instances are mentioned below:

| Type of Problem                | Class | Instances for each Class | Total Instances | Online Source | Please Cite |
|--------------------------------|:-----:|:------------------------:|:---------------:|:-------------:|:-----------:|
| Biobjective 1-D Knapsack       | 4     | 1                        | 4               | [1](http://pagesperso.lina.univ-nantes.fr/info/perso/permanents/jorge/bikp/1A.html)                                        | [^article1]   |
| Biobjective 1-D Knapsack       | 10    | 4                        | 40              | [2](http://pagesperso.lina.univ-nantes.fr/info/perso/permanents/jorge/bikp/1B.html)                                        | [^article2]   |
| Biobjective 1-D Knapsack       | 1     | 20                       | 20              | [3](http://pagesperso.lina.univ-nantes.fr/info/perso/permanents/jorge/bikp/2.html)                                        | [^article3]   |
| Biobjective 1-D Knapsack       | 1     | 15                       | 15              | [3](http://pagesperso.lina.univ-nantes.fr/info/perso/permanents/jorge/bikp/2.html)                                        | [^article3]   |
| Biobjective 1-D Knapsack       | 1     | 3                        | 3               | [3](http://pagesperso.lina.univ-nantes.fr/info/perso/permanents/jorge/bikp/2.html)                                        | [^article3]   |
| Biobjective 2-D Knapsack       | 4     | 5                        | 20              | [4](http://ogma.newcastle.edu.au:8080/vital/access/manager/Repository/uon:13218?exact=sm_creator%3A%22Charkhgard%2C+Hadi%22)                                 | [^article4]   |
| Biobjective Assingment Problem | 4     | 5                        | 20              | [4](http://ogma.newcastle.edu.au:8080/vital/access/manager/Repository/uon:13218?exact=sm_creator%3A%22Charkhgard%2C+Hadi%22)                                 | [^article4]   |
| Biobjective Set Covering       | 3     | 4                        | 12              | [5](http://xgandibleux.free.fr/MOCOlib/MOSCP.html)                                                                  | [^article5]   |
| Biobjective Set Packing        | 20    | 6                        | 120             | [6](http://www.emse.fr/~delorme/SetPacking.html#BOSPP)                                                             | [^article6]   |

## References: ##

[^article1]: Gandibleux, X. and Freville, A., 2000. Tabu search based procedure for solving the 0-1 multiobjective knapsack problem: the two objectives case. Journal of Heuristics, 6(3), pp.361-383. 
[^article2]: F. Degoutin and X. Gandibleux. Un retour d'expériences sur la résolution de problèmes combinatoires bi-objectifs. Journée Programmation Mathématique Multiobjectifs (PM2O). May 17th, 2002, Angers, France.
[^article3]: Captivo, M.E., Clı́maco, J., Figueira, J., Martins, E. and Santos, J.L., 2003. Solving bicriteria 0–1 knapsack problems using a labeling algorithm. Computers & Operations Research, 30(12), pp.1865-1886.
[^article4]: Boland, N., Charkhgard, H. and Savelsbergh, M., 2015. A criterion space search algorithm for biobjective integer programming: The balanced box method. INFORMS Journal on Computing, 27(4), pp.735-754.
[^article5]: Soylu, B., 2015. Heuristic approaches for biobjective mixed 0–1 integer linear programming problems. European Journal of Operational Research, 245(3), pp.690-703.
[^article6]: Delorme, X., Gandibleux, X. and Degoutin, F., 2010. Evolutionary, constructive and hybrid procedures for the bi-objective set packing problem. European Journal of Operational Research, 204(2), pp.206-217.


