push!(LOAD_PATH,"../src/")
using Documenter, MOOLib, MOOFramework

makedocs(
	modules = [MOOLib],
    format = :html,
    sitename = "MOOLib.jl",
    authors = "Aritra Pal",
    pages = Any[
        "Home" => "index.md",
        "Reading and Writing Instances" => "api.md",
        "Biobjective Binary Programs" => "bobp.md",
        "Random Instance Generators" => "random.md"
    ],
    doctest = false
)

deploydocs(
	deps = Deps.pip("pygments", "mkdocs", "mkdocs-material"),
	make = nothing,
    repo = "github.com/aritrasep/MOOLib.jl.git",
    target = "build",
    julia  = "0.5",
    osname = "ubuntu"
)
