library(tic)
BuildLesson <- R6::R6Class(
  "BuildLesson", inherit = TicStep,
  public = list(
    run = function() {
      build_status <- system("make clean-rmd; make lesson-md")
      if (build_status > 0)
        stop("Error during building process")

      file.remove(".gitignore")
      system("mkdir  _rendered")
      system("cp -r \`ls -A | grep -v '.git' | grep -v '_rendered' | grep -v '_site'\` _rendered")
    })
)

build_lesson <- function() {
  BuildLesson$new()
}


CheckLinks <- R6::R6Class(
  "CheckLinks", inherit = TicStep,
  public = list(
    run = function() {
      ## While build_lesson() merely copies the content of the repo into a
      ## new folder that GitHub picks up to render (so the dynamically
      ## generated links such as "Edit on GitHub" are functional), here we
      ## actually need to generate the website so we can test the links.
      on.exit(system("rm -rf _rendered/_site"))

      system("cd _rendered && rvm 2.5.3 do ruby -S jekyll build")

      res <- checker::check_links("_site",
        show_summary = TRUE,
        check_external = TRUE,
        only_with_issues = FALSE,
        ignore_pattern = "site_libs"
      )

      res
    })
)

check_links <- function() {
  CheckLinks$new()
}

cfg  <- rprojroot::has_file_pattern("^_config.y*ml$")
root <- rprojroot::find_root(cfg)

required_pkgs <- unique(c(
  ## Packages for episodes
  renv::dependencies(file.path(root, "_episodes_rmd"), progress = FALSE, error = "ignore")$Package,
  ## Pacakges for tools
  renv::dependencies(file.path(root, "bin"), progress = FALSE, error = "ignore")$Package
))

missing_pkgs <- setdiff(required_pkgs, rownames(installed.packages()))

if (length(missing_pkgs)) {
  message("Installing missing required packages: ",
    paste(missing_pkgs, collapse=", "))
  install.packages(missing_pkgs)
}
