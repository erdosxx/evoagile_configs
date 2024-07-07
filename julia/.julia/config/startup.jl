import Pkg

function install_package(pkg::String)
  if pkg == "REPLVim"
    @info "Installing $pkg..."
    @eval Pkg.add(url="https://github.com/andreypopp/julia-repl-vim")
  else
    @eval Pkg.add($pkg)
  end
end

function load_package(pkg::String)
  pkg_s = Symbol(pkg)

  @eval using $pkg_s
  if pkg == "REPLVim"
    @eval @async $pkg_s.serve()
  end
end

function load_install_package(pkg::String)
  try
    load_package(pkg)
  catch e
    @info "Not installed $pkg"
    if isa(e, ArgumentError)
      install_package(pkg)
      load_package(pkg)
    else
      @warn "Error while checking $pkg" exception = (e, catch_backtrace())
    end
  end
end

atreplinit() do repl
  packages = ["OhMyREPL", "Revise", "REPLVim", "PkgTemplates", "LanguageServer", "LibGit2"]

  for pkg in packages
    load_install_package(pkg)
  end
end

"""
    genGithubRepo(userName, repoName)

Generate GitHub repository with GitHubActions.

To generate package,
in the julia REPL
```julia
julia> genGithubRepo("evoagile", "repoName.jl")
```
"""

function genGithubRepo(userName::String, repoName::String)
  templateGithub = Template(;
    user=userName,
    dir="~/localgit",
    julia=v"1",  # for [compat] section in Project.toml
    plugins=[
      # Use semantic version, See Julia Pattern book page 43.
      ProjectFile(; version=v"1.0.0-DEV"),
      License(; name="MIT", path=nothing, destination="LICENSE"),
      Git(;
        branch=LibGit2.getconfig("init.defaultBranch", "master"),
        ssh=true,
        jl=true,
        manifest=false),
      GitHubActions(;
        destination="CI.yml",
        linux=true,
        osx=false,
        windows=false,
        x64=true,
        x86=false,
        coverage=true,
        extra_versions=["1.8", "1.9", "1.10", "nightly"]),
      CompatHelper(; destination="CompatHelper.yml", cron="0 0 * * *"),
      TagBot(;
        destination="TagBot.yml",
        trigger="JuliaTagBot",
        token=Secret("GITHUB_TOKEN"),
        ssh=Secret("DOCUMENTER_KEY"),
        ssh_password=nothing,
        changelog=nothing,
        changelog_ignore=nothing,
        gpg=nothing,
        gpg_password=nothing,
        registry=nothing,
        branches=nothing,
        dispatch=nothing,
        dispatch_delay=nothing),
      Codecov(),
      Documenter{GitHubActions}(logo=Logo(;
        light=homedir() * "/.config/logo/logo.png",
        dark=homedir() * "/.config/logo/logo-dark.png")),
      Dependabot(),
    ])
  generate(templateGithub, repoName)
end
