# Check if Lato and Poppins Fonts are Imported
#'
#' @returns TRUE if fonts are imported. If FALSE, prints warning.
washi_check_fonts <- function() {
  fonts <- all(c("Lato", "Poppins") %in% extrafont::fonts())

  if (isFALSE(fonts)) {
    cli::cli_warn("Fonts not imported. Call `washi_import_fonts()`.")
  }

  return(fonts)
}

#' Import Lato and Poppins fonts
#'
#' @export
#'
washi_import_fonts <- function() {
  # Notify if fonts are already installed
  if (isTRUE(washi_check_fonts())) {
    cli::cli_inform(
      c("v" = "Lato and Poppins are already on your system.")
    )
  }

  # Otherwise install fonts and notify
  else {
    suppressWarnings(suppressMessages(
      extrafont::font_import(pattern = "Lato", prompt = FALSE)
    ))
    suppressWarnings(suppressMessages(
      extrafont::font_import(pattern = "Poppins", prompt = FALSE)
    ))
    cli::cli_inform(
      c("v" = "Lato and Poppins have been imported.")
    )
  }
}
