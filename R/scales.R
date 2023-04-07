#' Scales for plotting with washi palettes
#'
#' Provides compatibility with `ggplot2`.
#'
#' @inheritParams palette_setup
#' @param aesthetics Character string or vector of character strings listing the
#'   name(s) of the aesthetic(s) that this scale works with. Defaults to
#'   c("color", "fill"), which applies the palette to both the color and fill
#'   aesthetics at the same time.
#' @param alpha Numeric transparency level of the color from 0 to 1. Default is
#'   1 (not transparent).
#' @param discrete Boolean indicating whether color aesthetic is discrete or
#'   not. Default is TRUE.
#' @param ... Additional arguments passed to discrete_scale() or
#'   scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#' @returns A `ScaleContinuous` or `ScaleDiscrete` object that can be added to a
#'   `ggplot` object
#' @examples
#' library(ggplot2)
#'
#' # Discrete scale with color aesthetic
#' ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +
#'   geom_point(size = 3.5) +
#'   theme_minimal() +
#'   scale_washi("color_blind", aesthetics = "color", alpha = 0.7)
#'
#' # Discrete scale with fill aesthetic
#' ggplot(mtcars, aes(factor(vs), color = factor(cyl))) +
#'   geom_bar(fill = "white", linewidth = 1.5) +
#'   theme_minimal() +
#'   scale_washi("color_blind", aesthetics = "color", reverse = TRUE)
#'
#' # Continuous scale
#' ggplot(diamonds) +
#'   geom_point(aes(x = carat, y = price, color = price)) +
#'   theme_minimal() +
#'   scale_washi("green_gradient", reverse = TRUE, discrete = FALSE)
#' @export
scale_washi <- function(palette = "color_blind",
                        aesthetics = c("color", "fill"),
                        alpha = 1,
                        reverse = FALSE,
                        discrete = TRUE,
                        ...) {
  pal <- palette_setup(palette = palette, reverse = reverse)

  if (alpha < 0 | alpha > 1) stop("alpha must be in [0, 1]")

  pal <- scales::alpha(pal, rep_len(alpha, length(pal)))

  aesthetics <- match.arg(aesthetics, several.ok = TRUE)

  if (discrete == TRUE) {
    ggplot2::discrete_scale(
      aesthetics = aesthetics,
      scale_name = paste0("washi_", palette),
      palette = scales::manual_pal(pal),
      ...
    )
  } else {
    ggplot2::scale_color_gradientn(colors = pal, ...)
  }
}
