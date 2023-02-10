using SF36
using Documenter

DocMeta.setdocmeta!(SF36, :DocTestSetup, :(using SF36); recursive=true)

makedocs(;
    modules=[SF36],
    authors="Vladimir Arnautov",
    repo="https://github.com/PharmCat/SF36.jl/blob/{commit}{path}#{line}",
    sitename="SF36.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://PharmCat.github.io/SF36.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/PharmCat/SF36.jl",
    devbranch="main",
)
