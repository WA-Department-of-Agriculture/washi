#' Scales for plotting with WaSHI palettes
#'
#' Provides compatibility with `ggplot2`.
#'
#' @inheritParams washi_pal_setup
#' @param aesthetics Character string or vector of character strings
#'   listing the name(s) of the aesthetic(s) that this scale works
#'   with. Defaults to c("color", "fill"), which applies the palette
#'   to both the color and fill aesthetics at the same time.
#' @param alpha Numeric transparency level of the color from 0 to 1.
#'   Default is 1 (not transparent).
#' @param discrete Boolean indicating whether color aesthetic is
#'   discrete or not. Default is TRUE.
#' @param ... Additional arguments passed to discrete_scale() or
#'   scale_color_gradientn(), used respectively when discrete is TRUE
#'   or FALSE
#' @returns A `ScaleContinuous` or `ScaleDiscrete` object that can be
#'   added to a `ggplot` object.
#' @family ggplot2 functions
#' @examples
#' library(ggplot2)
#'
#' # Discrete scale
#' example_data_wide |>
#'   subset(crop %in% c("Apple", "Cherry", "Potato")) |>
#'   ggplot(aes(x = ph, y = mn_mg_kg, color = crop)) +
#'   geom_point(size = 2.5) +
#'   theme_minimal() +
#'   washi_scale()
#'
#' # Continuous scale
#' example_data_wide |>
#'   ggplot(aes(x = total_c_percent, y = poxc_mg_kg, color = poxc_mg_kg)) +
#'   geom_point(size = 2.5) +
#'   theme_minimal() +
#'   washi_scale("green_gradient", reverse = TRUE, discrete = FALSE)
#' @export
washi_scale <- function(
  palette = "color_blind",
  aesthetics = c("color", "fill"),
  alpha = 1,
  reverse = FALSE,
  discrete = TRUE,
  ...
) {
  pal <- washi_pal_setup(palette = palette, reverse = reverse)

  if (alpha < 0 | alpha > 1) {
    cli::cli_abort("Alpha must be between 0 and 1.")
  }

  if (!is.logical(discrete)) {
    cli::cli_abort("`discrete` must be `TRUE` or `FALSE`.")
  }

  pal <- scales::alpha(pal, rep_len(alpha, length(pal)))

  aesthetics <- match.arg(aesthetics, several.ok = TRUE)

  if (discrete == TRUE) {
    ggplot2::discrete_scale(
      aesthetics = aesthetics,
      palette = scales::manual_pal(pal),
      ...
    )
  } else {
    ggplot2::scale_color_gradientn(colors = pal, ...)
  }
}
