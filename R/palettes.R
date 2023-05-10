#' WaSHI color palettes
#'
#' Color palettes are stored in a named list.
#'
#' @returns List of available `washi` color palettes
#' @family color palette functions
#' @examples
#' # List names of available palettes
#' names(washi_pal)
#'
#' # Get hex codes from a palette using dollar `$name` or
#' # double bracket
#' # `[["name"]]` operators for extracting list elements
#' washi_pal$standard
#'
#' washi_pal[["green_gradient"]]
#'
#' # Extract a color from the standard WaSHI palette
#' washi_pal[["standard"]][["green"]]
#' @export

washi_pal <- list(
  # WaSHI standard brand colors
  standard = c(
    green = "#023b2c",
    blue = "#335c67",
    red = "#a60f2d",
    gold = "#fcb040",
    gray = "#3e3d3d",
    ltgray = "#7C7979",
    tan = "#ccc29c",
    cream = "#F2F0E6"
  ),
  # WaSHI 6 color blind safe palette
  # checked accessibility with Adobe color wheel and Viz Palette
  color_blind = c(
    green = "#03634A",
    gold = "#FCB040",
    blue = "#7AB7C6",
    red = "#700004",
    ltgray = "#7C7979",
    tan = "#D3CF9D"
  ),
  # WaSHI accent colors
  accent = c(
    gray = "#3e3d3d",
    ltgray = "#7C7979",
    tan = "#ccc29c",
    cream = "#F2F0E6"
  ),
  # green highight color with subdued gray and tan colors
  green_highlight = c(
    green = "#023b2c",
    ltgray = "#7C7979",
    tan = "#ccc29c"
  ),
  # blue highight color with subdued gray and tan colors
  blue_highlight = c(
    blue = "#335c67",
    ltgray = "#7C7979",
    tan = "#ccc29c"
  ),
  # red highight color with subdued gray and tan colors
  red_highlight = c(
    red = "#a60f2d",
    ltgray = "#7C7979",
    tan = "#ccc29c"
  ),
  # gold highight color with subdued gray and tan colors
  gold_highlight = c(
    gold = "#fcb040",
    ltgray = "#7C7979",
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
    "#BCC7BC"
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
    "#C7CFC9"
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
    "#E1BDBC"
  ),
  # gold gradient
  gold_gradient = c(
    "#FCB040",
    "#FBB54F",
    "#FABB5E",
    "#F9C16D",
    "#F8C77C",
    "#F7CD8B",
    "#F6D29A",
    "#F5D8A9"
  )
)

#' Setup a color palette
#'
#' Choose desired number of colors and whether the colors are
#' reversed.
#'
#' @param palette Character name of palette in washi_pal. See
#'   `names(washi_pal)` for a list of available palettes.
#' @param n Number of colors in palette.
#' @param reverse Boolean indicating whether the palette should be
#'   reversed. Default is FALSE.
#'
#' @returns A vector of color hex codes.
#' @family color palette functions
#' @examples
#' washi_pal_setup("color_blind")
#'
#' washi_pal_setup("green_gradient", 12)
#' @export
washi_pal_setup <- function(palette = "standard",
                            n,
                            reverse = FALSE) {
  if (!palette %in% names(washi_pal)) {
    cli::cli_abort(c(
      "There is no palette called `{palette}`.",
      "i" = "List available palettes with `names(washi_pal)`."
    ))
  }

  if (!is.logical(reverse)) {
    cli::cli_abort(c(
      "`reverse` must be `TRUE` or `FALSE`."
    ))
  }

  if (missing(n)) {
    n <- length(washi_pal[[palette]])
  }

  if (!is.numeric(n) | is.null(n)) {
    cli::cli_abort(c(
      "`n` must be numeric."
    ))
  }

  pal <- washi_pal[[palette]]

  if (reverse) pal <- rev(pal)

  grDevices::colorRampPalette(pal)(n)
}

#' View a WaSHI palette
#'
#' Show the colors within a palette in a plot.
#'
#' @inheritParams washi_pal_setup
#' @returns A plot with each color displayed.
#' @family color palette functions
#'
#' @examples
#' washi_pal_view("standard")
#'
#' washi_pal_view("color_blind")
#'
#' washi_pal_view("blue_gradient", 4, reverse = TRUE)
#' @export
washi_pal_view <- function(palette = "color_blind",
                           n,
                           reverse = FALSE) {
  if (missing(n)) {
    n <- length(washi_pal[[palette]])
  }
  pal <- washi_pal_setup(palette, n, reverse)

  graphics::image(1:n, 1, as.matrix(1:n),
    col = pal,
    xlab = paste(palette), ylab = "", xaxt = "n",
    yaxt = "n", bty = "n"
  )
  graphics::box()
}
