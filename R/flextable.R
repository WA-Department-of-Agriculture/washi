#' WaSHI flextable style
#'
#' Creates a flextable in WaSHI's style.
#'
#' @param data Dataframe for the table.
#' @param cols_bold Numeric indices of columns to bold. Defaults to
#'   `NULL`.
#' @param header_font_color Hexcode color for header font. Defaults to
#'   white.
#' @param header_bg_color Hexcode color for header background.
#'   Defaults to WaSHI green.
#' @param border_color Hexcode color for horizontal borders. Defaults
#'   to WaSHI tan.
#'
#' @returns A flextable formatted in WaSHI's style.
#' @family table functions
#'
#' @examples
#' subset(example_data_wide, select = c(
#'   "sampleId", "county", "crop", "totalN_%", "totalC_%"
#' )) |>
#'   washi_flextable(cols_bold = 1)
#' @export
washi_flextable <- function(data,
                            cols_bold = NULL,
                            header_font_color = "white",
                            header_bg_color = washi_pal[["standard"]][["green"]],
                            border_color = washi_pal[["standard"]][["tan"]]) {
  if (interactive() & !isNamespaceLoaded("extrafont")) {
    cli::cli_warn(c(
      "The {.pkg extrafont} package is not loaded.",
      "Call `library(extrafont)`."
    ))
  }

  if (is.character(cols_bold)) {
    cli::cli_abort(c(
      "`cols_bold` must be numeric column indices."
    ))
  }

  if (!is.character(header_font_color)) {
    cli::cli_abort("`header_font_color` must be character color name or code.")
  }

  if (!is.character(header_bg_color)) {
    cli::cli_abort("`header_bg_color` must be character color name or code..")
  }

  # Set default font to Poppins
  flextable::set_flextable_defaults(font.family = "Poppins")

  # Set header background
  header_cell <- officer::fp_cell(
    background.color = header_bg_color
  )

  # Set header text
  header_text <- officer::fp_text(
    font.family = "Lato",
    font.size = 12,
    bold = TRUE,
    color = header_font_color
  )

  ft <- flextable::flextable(data) |>
    flextable::style(
      pr_t = header_text,
      pr_c = header_cell,
      part = "header"
    ) |>
    flextable::style(
      pr_c = officer::fp_cell(background.color = "white"),
      part = "body"
    ) |>
    # Horizontal borders
    flextable::hline(
      border = officer::fp_border(color = border_color),
      part = "body"
    ) |>
    # Merge header cells when consecutive cells have identical values
    flextable::merge_h(part = "header") |>
    # Center header text
    flextable::align(align = "center", part = "header") |>
    # Autofit with a little added padding
    flextable::autofit(add_w = 0.1, add_h = 0.1)

  # Bold columns
  if (!is.null(cols_bold)) {
    ft <- ft |>
      flextable::bold(j = cols_bold, bold = TRUE, part = "body")
  }

  return(ft)
}
