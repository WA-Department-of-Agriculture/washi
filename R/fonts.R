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
      "*" = "Right-click + {.pkg Install for all users}.",
      "*" = "If you don't have admin permission, click {.pkg Install}.",
      "*" = "Run {.fn washi_import_fonts} to make them available in R."
    ))
  } else {
    cli::cli_bullets(c(
      "i" = "To install fonts on non-Windows platforms:",
      "*" = "Double click on the font files to open a dialog box.",
      "*" = "Click {.pkg Install}.",
      "!" = "Or, drag & drop them into your system's font folder or app.",
      "*" = "(MacOS has {.pkg FontBook}."
    ))
  }
}

#' Import Lato and Poppins fonts
#'
#' Uses `extrafont` and `grDevices` to import fonts into the
#' `extrafontdb` database so they may be used in R plots and tables.
#' This function should only need to be run once. Though `library(extrafont)`
#' must be called in each session.
#'
#' @returns Imports Lato and Poppins for use in R.
#'
#' @family font functions
#' @export
#'
washi_import_fonts <- function() {
  # Check if fonts are already imported
  fonts <- c("Lato", "Poppins")

  # If fonts not yet imported, import them
  if (!all(fonts %in% extrafont::fonts())) {
    suppressWarnings(suppressMessages(
      extrafont::font_import(pattern = "Lato", prompt = FALSE)
    ))
    suppressWarnings(suppressMessages(
      extrafont::font_import(pattern = "Poppins", prompt = FALSE)
    ))
    # Inform success
    cli::cli_bullets(c(
      "v" = "Lato and Poppins fonts successfully imported!",
      "i" = "You may need to restart your R session."
    ))
  } else {
    cli::cli_alert_info(
      "Lato and Poppins fonts have already been imported."
    )
  }
}
