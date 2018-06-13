#' A wrapper for `system.file()`
#' @noRd
system_file <- function(file) {
  system.file(file, package = "htmldeps")
}

#' An HTML dependency using `jquery.js`
#' @importFrom htmltools htmlDependency
#' @export
html_dependency_jquery <- function()  {

  htmltools::htmlDependency(
    name = "hd-jquery",
    version = "1.11.3",
    src = system_file(file = "rmd/h/jquery"),
    script = "jquery.min.js")
}

#' An HTML dependency using `jqueryui.js`
#' @importFrom htmltools htmlDependency
#' @export
html_dependency_jqueryui <- function() {

  htmltools::htmlDependency(
    name = "hd-jqueryui",
    version = "1.11.4",
    src = system_file(file = "rmd/h/jqueryui"),
    script = "jquery-ui.min.js")
}

#' An HTML dependency using `bootstrap.js`
#' @importFrom htmltools htmlDependency
#' @export
html_dependency_bootstrap <- function(theme) {

  if (identical(theme, "default")) {
    theme <- "bootstrap"
  }

  htmltools::htmlDependency(
    name = "hd-bootstrap",
    version = "3.3.5",
    src = system_file(file = "rmd/h/bootstrap"),
    meta = list(viewport = "width=device-width, initial-scale=1"),
    script = c(
      "js/bootstrap.min.js",
      # These shims are necessary for IE 8 compatibility
      "shim/html5shiv.min.js",
      "shim/respond.min.js"),
    stylesheet = paste0("css/", theme, ".min.css"))
}

#' An HTML dependency using `tocify.js`
#' @importFrom htmltools htmlDependency
#' @export
html_dependency_tocify <- function() {

  htmltools::htmlDependency(
    name = "hd-tocify",
    version = "1.9.1",
    src = system_file(file = "rmd/h/tocify"),
    script = "jquery.tocify.js",
    stylesheet = "jquery.tocify.css")
}

#' An HTML dependency for navigation
#'
#' We can build a script list that contains
#' `tabsets.js` and either of (or both)
#' `codefolding.js` or `sourceembed.js`.
#' @importFrom htmltools htmlDependency
#' @export
html_dependency_navigation <- function(code_menu, source_embed) {

  # Dynamically build script list
  script <- c("tabsets.js")

  if (code_menu) {
    script <- c(script, "codefolding.js")
  }

  if (source_embed) {
    script <- c(script, "sourceembed.js")
  }

  htmltools::htmlDependency(
    name = "hd-navigation",
    version = "1.1",
    src = system_file(file = "rmd/h/navigation"),
    script = script)
}

#' An HTML dependency for FontAwesome
#' @importFrom htmltools htmlDependency
#' @export
html_dependency_font_awesome <- function() {

  htmltools::htmlDependency(
    name = "hd-font-awesome",
    version = "5.0.13",
    src = system_file(file = "rmd/h/fontawesome"),
    script = c(
      "js/fontawesome-all.min.js",
      "js/fa-v4-shims.min.js"),
    stylesheet = "css/fa-svg-with-js.css")
}

#' An HTML dependency for ionicons
#' @importFrom htmltools htmlDependency
#' @export
html_dependency_ionicons <- function() {

  htmltools::htmlDependency(
    name = "hd-ionicons",
    version = "2.0.1",
    src = system.file(file = "rmd/h/ionicons"),
    stylesheet = "css/ionicons.min.css")
}
