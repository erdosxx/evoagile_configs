# Display the entire type hierarchy starting from
# the specified `roottype`
function subtypetree(roottype, level = 1, indent = 4)
  level == 1 && println(roottype)
  for s in subtypes(roottype)
    println(join(fill(" ", level * indent)) * string(s))
    subtypetree(s, level + 1, indent)
  end
end

"""
    template()
Generate GitHub repository with GitHubActions.

To generate package,
in the julia REPL
```julia
julia> generate(templateGithub, "<repoName>.jl")
```

"""
function genGithubRepo()
  @eval begin
    using PkgTemplates
    using LibGit2
    templateGithub = Template(;
      user = "evoagile",   # evoagile for organization
      dir = "~/localgit",
      julia = v"1.8",  # minimum allowed julia version
      plugins = [
        ProjectFile(; version = v"0.0.1-DEV"),
        License(; name = "MIT", path = nothing, destination = "LICENSE"),
        Git(;
          branch = LibGit2.getconfig("init.defaultBranch", "master"),
          ssh = true,
          jl = true,
          manifest = false,
        ),
        GitHubActions(;
          destination = "CI.yml",
          linux = true,
          osx = false,
          windows = false,
          x64 = true,
          x86 = false,
          coverage = true,
          extra_versions = ["1.8", "1.9", "nightly"],
        ),
        CompatHelper(; destination = "CompatHelper.yml", cron = "0 0 * * *"),
        TagBot(;
          destination = "TagBot.yml",
          trigger = "JuliaTagBot",
          token = Secret("GITHUB_TOKEN"),
          ssh = Secret("DOCUMENTER_KEY"),
          ssh_password = nothing,
          changelog = nothing,
          changelog_ignore = nothing,
          gpg = nothing,
          gpg_password = nothing,
          registry = nothing,
          branches = nothing,
          dispatch = nothing,
          dispatch_delay = nothing,
        ),
        Codecov(),
        Documenter{GitHubActions}(
          logo = Logo(;
            light = homedir() * "/.config/logo/logo.png",
            dark = homedir() * "/.config/logo/logo-dark.png",
          ),
        ),
        Dependabot(),
      ],
    )
  end
end

atreplinit() do repl
  try
    @eval using OhMyREPL
    @eval using Revise
    @eval using REPLVim
    @eval @async REPLVim.serve()
    @eval genGithubRepo()
  catch e
    @warn "error while loading OhMyREPL, Revise and REPLVim" e
  end
end
