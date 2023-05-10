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
      "*" = "Select all font files in the newly opened directory.",
      "*" = "Right-click",
      "*" = "Click {.code Install for all users}.",
      "*" = "If you don't have admin permission, click {.code Install}.",
      "*" = "Run {.fn washi::washi_register_fonts} to make them available in R."
    ))
  } else {
    cli::cli_bullets(c(
      "i" = "To install fonts on non-Windows platforms:",
      "*" = "Try double clicking on the font files to open a dialog box with an {.code Install} option",
      "*" = "Or find your font folder or app (MacOS has a {.emph Font Book} to drag and drop the font files into."
    ))
  }
}

#' Register Lato and Poppins fonts in R
#'
#' Uses `extrafont` and `grDevices` to register fonts so they may be
#' used in R plots and tables. This function only needs to be run
#' once. Though `library(extrafont)` must be called in each session.
#'
#' @returns Registers Lato and Poppins for use in R.
#'
#' @family font functions
#' @export
#'
washi_register_fonts <- function() {
  # Check if fonts are already registered
  fonts <- c("Lato", "Poppins")

  # If fonts not yet registered, register them
  if (!all(fonts %in% extrafont::fonts())) {
    if (.Platform$OS.type == "windows") {
      grDevices::windowsFonts(
        `Lato` = grDevices::windowsFont("Lato")
      )
      grDevices::windowsFonts(
        `Poppins` = grDevices::windowsFont("Poppins")
      )
    } else {
      suppressWarnings(suppressMessages(
        extrafont::font_import(pattern = "Lato", prompt = FALSE)
      ))
      suppressWarnings(suppressMessages(
        extrafont::font_import(pattern = "Poppins", prompt = FALSE)
      ))
    }
    # Inform success
    cli::cli_bullets(c(
      "v" = "Lato and Poppins fonts successfully registered in R!",
      "i" = "You may need to restart your R session."
    ))
  } else {
    cli::cli_alert_info(
      "Lato and Poppins fonts are already registered in R."
    )
  }
}
