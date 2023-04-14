#' Import Lato and Poppins fonts
#'
#' @export
#'
washi_import_fonts <- function() {
  # Check if fonts are already installed
  fonts_installed <- function() {
    all(c("Lato", "Poppins") %in% extrafont::fonts())
  }
  # Notify if fonts are already installed
  if (fonts_installed()) {
    cli::cli_inform(
      c("i" = "Lato and Poppins fonts are already on your system."),
      .frequency = "once", .frequency_id = "fonts"
    )
  # Otherwise install fonts and notify
  } else {
    suppressWarnings(suppressMessages(
      extrafont::font_import(pattern = "Lato", prompt = FALSE)
    ))
    suppressWarnings(suppressMessages(
      extrafont::font_import(pattern = "Poppins", prompt = FALSE)
    ))
    cli::cli_inform(
      c("v" = "Lato and Poppins fonts have been imported."),
      .frequency = "once", .frequency_id = "fonts"
    )
  }
}
