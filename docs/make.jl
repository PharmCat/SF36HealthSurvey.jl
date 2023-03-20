using SF36HealthSurvey
using Documenter

DocMeta.setdocmeta!(SF36HealthSurvey, :DocTestSetup, :(using SF36HealthSurvey); recursive=true)

makedocs(;
    modules=[SF36],
    authors="Vladimir Arnautov",
    repo="https://github.com/PharmCat/SF36HealthSurvey.jl/blob/{commit}{path}#{line}",
    sitename="SF36HealthSurvey.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://PharmCat.github.io/SF36HealthSurvey.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/PharmCat/SF36HealthSurvey.jl",
    devbranch="main",
)
