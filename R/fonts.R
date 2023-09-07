#' Install Lato and Poppins fonts on your system
#'
#' Opens the font files to install on your computer.
#'
#' @returns Opens a directory containing font files.
#' @family font functions
#' @export
washi_install_fonts <- function() {
  # Get directory of font files
  font_dir <- system.file("fonts", package = "washi")

  # Open font directory
  if (interactive()) {
    cli::cli_alert_info("Opening {.path {font_dir}} with fonts.")
    utils::browseURL(font_dir)
  }

  # Instructions for installing fonts on windows
  if (.Platform$OS.type == "windows") {
    cli::cli_bullets(c(
      "i" = "To install the fonts on Windows:",
      "*" = "Select all {.pkg .ttf} files in the newly opened directory.",
      "*" = "Right-click + {.pkg Install}.",
      "*" = "Restart RStudio."
    ))
  } else {
    cli::cli_bullets(c(
      "i" = "To install fonts on non-Windows platforms:",
      "*" = "Double click on the font files to open a dialog box.",
      "*" = "Click {.pkg Install}.",
      "!" = "Or, drag & drop them into your system's font folder or app.",
      "*" = "(MacOS has {.pkg FontBook}.",
      "*" = "Restart RStudio."
    ))
  }
}

#' Check fonts
#' Change font to "sans" if given font isn't found
#' @noRd
check_fonts <- function(header_font, body_font) {
  fonts <- c(systemfonts::system_fonts()$family, "sans", "serif", "mono")

  if (!header_font %in% fonts) {
    header_font <- "sans"
    cli::cli_inform("Couldn't find {.pkg '{header_font}'}.
                    Defaulting to {.pkg 'sans'.}")
  }

  if (!body_font %in% fonts) {
    body_font <- "sans"
    cli::cli_inform("Couldn't find {.pkg '{body_font}'}.
                    Defaulting to {.pkg 'sans'.}")
  }
}
