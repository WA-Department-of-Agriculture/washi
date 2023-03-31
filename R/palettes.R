#' WaSHI color palettes
#'
#' Color palettes are stored in a named list.
#' @examples
#' # List names of available palettes
#' names(palettes_washi)
#'
#' # Get hex codes from a palette using dollar `$name` or
#' # double bracket `[["name"]]` operators for extracting
#' # list elements
#' palettes_washi$standard
#' palettes_washi[["green_gradient"]]
#'
#' # Extract a color from the standard WaSHI palette
#' palettes_washi[["standard"]][["green"]]
#' @export
palettes_washi <- list(
  # WaSHI standard brand colors
  standard = c(
    green = "#023b2c",
    gray = "#3e3d3d",
    blue = "#335c67",
    red = "#a60f2d",
    gold = "#fcb040",
    tan = "#ccc29c",
    cream = "#F2F0E6"
  ),
  # green highight color with subdued gray and tan colors
  green_highlight = c(
    green = "#023b2c",
    gray = "#3e3d3d",
    tan = "#ccc29c"
  ),
  # red highight color with subdued gray and tan colors
  red_highlight = c(
    red = "#a60f2d",
    gray = "#3e3d3d",
    tan = "#ccc29c"
  ),
  # gold highight color with subdued gray and tan colors
  gold_highlight = c(
    gold = "#fcb040",
    gray = "#3e3d3d",
    tan = "#ccc29c"
  ),
  # green gradient
  green_gradient = c(
    "#023B2C",
    "#1C4F40",
    "#376355",
    "#51776A",
    "#6C8B7E",
    "#879F93",
    "#A2B3A8",
    "#BCC7BC",
    "#D7DBD1",
    "#F2F0E6"
  ),
  # blue gradient
  blue_gradient = c(
    "#335C67",
    "#486C75",
    "#5D7C83",
    "#728D91",
    "#879D9F",
    "#9DAEAD",
    "#B2BEBB",
    "#C7CFC9",
    "#DCDFD7",
    "#F2F0E6"
  ),
  # red gradient
  red_gradient = c(
    "#A60F2D",
    "#AE2841",
    "#B64156",
    "#BF596A",
    "#C7727F",
    "#D08C93",
    "#D8A4A8",
    "#E1BDBC",
    "#E9D6D1",
    "#F2F0E6"
  )
)

#' Setup a color palette
#'
#' Choose desired number of colors and whether the colors are reversed.
#'
#' @param palette Character name of palette in palettes_washi. See
#'   `names(palettes_washi)` for a list of available palettes.
#' @param n Number of colors in palette.
#' @param reverse Boolean indicating whether the palette should be reversed.
#'   Default is FALSE.
#' @returns A vector of color hex codes.
#' @examples
#' palette_setup("standard")
#' palette_setup("green_gradient", 12)
#' @export
palette_setup <- function(palette = "standard",
                          n,
                          reverse = FALSE) {
  if (!palette %in% names(palettes_washi)) {
    stop(glue::glue("There is no palette called '{palette}'.
         Use `names(palettes_washi)` to see available palettes."),
      call. = FALSE
    )
  }

  if (missing(n)) {
    n <- length(palettes_washi[[palette]])
  }

  pal <- palettes_washi[[palette]]

  if (reverse) pal <- rev(pal)

  grDevices::colorRampPalette(pal)(n)
}

#' View a WaSHI palette
#'
#' Show the colors within a palette in a plot.
#'
#' @inheritParams palette_setup
#' @examples
#' palette_view("standard")
#' palette_view("gold_highlight", 3)
#' palette_view("blue_gradient", 4, reverse = TRUE)
#' @returns A plot with each color displayed.
#' @export
palette_view <- function(palette = "standard", n, reverse = FALSE) {
  if (missing(n)) {
    n <- length(palettes_washi[[palette]])
  }
  pal <- palette_setup(palette, n, reverse)

  graphics::image(1:n, 1, as.matrix(1:n),
    col = pal,
    xlab = paste(palette), ylab = "", xaxt = "n",
    yaxt = "n", bty = "n"
  )
  graphics::box()
}
