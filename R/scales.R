#' Scales for plotting with washi palettes
#'
#' Provides compatibility with `ggplot2`.
#'
#' @inheritParams palette_setup
#' @param discrete Boolean indicating whether color aesthetic is discrete or
#'   not. Default is TRUE.
#' @param aesthetics Character string or vector of character strings listing the
#'   name(s) of the aesthetic(s) that this scale works with. Defaults to
#'   c("color", "fill"), which applies the palette to both the color and fill
#'   aesthetics at the same time.
#' @param ... Additional arguments passed to discrete_scale() or
#'   scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#' @returns A `ScaleContinuous` or `ScaleDiscrete` object that can be added to a
#'   `ggplot` object
#' @examples
#' library(ggplot2)
#'
#' # Discrete scale
#' ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +
#'   geom_point(size = 4) +
#'   theme_minimal() +
#'   scale_color_washi("main")
#'
#' # Continuous scale
#' ggplot(diamonds) +
#'   geom_point(aes(x = carat, y = price, color = price)) +
#'   theme_minimal() +
#'   scale_color_washi("green_gradient", reverse = TRUE, discrete = FALSE)
#' @export
scale_color_washi <- function(palette = "main",
                              reverse = FALSE,
                              aesthetics = c("color", "fill"),
                              discrete = TRUE,
                              ...) {

  pal <- palette_setup(palette = palette, reverse = reverse)

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
