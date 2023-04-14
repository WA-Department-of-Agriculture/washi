#' Import Lato and Poppins fonts
#'
#' @export
#'
washi_import_fonts <- function() {
  # Check if fonts are already installed
  fonts <- c("Lato", "Poppins")
  if (!all(fonts %in% extrafont::fonts())) {
    # Determine user OS
    # https://stackoverflow.com/questions/4463087/detecting-operating-system-in-r-e-g-for-adaptive-rprofile-files
    user_os <- Sys.info()[["sysname"]]

    if (user_os == "Windows") {
      grDevices::windowsFonts(
        `Lato` = grDevices::windowsFont("Lato"))
      grDevices::windowsFonts(
        `Poppins` = grDevices::windowsFont("Poppins"))
    } else {
      suppressWarnings(suppressMessages(
        extrafont::font_import(pattern = "Lato", prompt = FALSE)))
      suppressWarnings(suppressMessages(
        extrafont::font_import(pattern = "Poppins", prompt = FALSE)))
    }

    cli::cli_inform(
      c("v" = "Lato and Poppins fonts have been imported."),
      .frequency = "once", .frequency_id = "fonts"
    )
  } else {
    cli::cli_inform(
      c("i" = "Lato and Poppins fonts are already on your system."),
      .frequency = "once", .frequency_id = "fonts"
    )
  }
}
