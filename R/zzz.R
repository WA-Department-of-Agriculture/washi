.onAttach <- function(libname, pkgname) {
  poppins_dir <- system.file("fonts", "poppins", package = "washi")
  lato_dir <- system.file("fonts", "lato", package = "washi")
  extrafont::loadfonts(quiet = TRUE)
}
