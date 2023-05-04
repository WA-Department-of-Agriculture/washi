#' Create standard washi plots
#'
#' Adapted from
#' \href{https://github.com/USAID-OHA-SI/glitr/blob/main/R/si_style.R}{glitr::si_style()}.
#' All changed defaults from this function can be overriden by another
#' call to [ggplot2::theme()] with the desired changes.
#'
#' @param font_title Font family for title. Defaults to "Lato Black".
#' @param color_title Font color for title. Defaults to almost black.
#' @param font_subtitle Font family for subtitle. Defaults to "Lato
#'   Black".
#' @param color_subtitle Font color for title. Defaults to almost
#'   black.
#' @param font_plot Font family for plot text. Defaults to "Poppins".
#' @param color_plot_text Font color for title. Defaults to almost
#'   black.
#' @param font_caption Font family for caption. Defaults to "Poppins".
#' @param color_caption Font color for title. Defaults to almost
#'   black.
#' @param text_scale Scalar that will grow/shrink all text defined
#'   within.
#' @param legend_position Position of legend ("none", "left", "right",
#'   "bottom", "top", or two-element numeric vector). Defaults to
#'   "top".
#' @param facet_space Controls how far apart facets are from each
#'   other.
#' @param color_gridline Gridline color. Defaults to washi tan.
#' @param gridline_x Boolean indicating whether major gridlines are
#'   displayed for the x axis. Default is TRUE.
#' @param gridline_y Boolean indicating whether major gridlines are
#'   displayed for the y axis. Default is TRUE.
#' @param ... Pass any parameters from theme that are not already
#'   defined within
#'
#' @export
#' @importFrom ggplot2 %+replace%
#'
#' @examples
#' \dontrun{
#' library(extrafont)
#' library(ggplot2)
#'
#' # Single plot
#'
#' ggplot(iris, aes(Sepal.Length, y = Sepal.Width, color = Species)) +
#'   labs(
#'     title = "washi_theme() + washi_scale()",
#'     subtitle = "This is a subtitle.",
#'     caption = "This is a caption."
#'   ) +
#'   geom_point(size = 2.5) +
#'   washi_theme() +
#'   washi_scale()
#'
#' # Facet plot
#'
#' ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
#'   labs(
#'     title = "washi_theme() + washi_scale()",
#'     subtitle = "Example of facet_grid().",
#'     caption = "This is a caption."
#'   ) +
#'   geom_histogram(bins = 15) +
#'   facet_grid(. ~ Species) +
#'   washi_theme(legend_position = "none") +
#'   washi_scale()
#' }
washi_theme <- function(font_title = "Lato Black",
                        color_title = "#151414",
                        font_subtitle = "Lato Black",
                        color_subtitle = "#151414",
                        font_caption = "Poppins",
                        color_caption = "#151414",
                        font_plot = "Poppins",
                        color_plot_text = "#151414",
                        text_scale = 1,
                        legend_position = "top",
                        facet_space = 2,
                        color_gridline = washi_pal[["standard"]][["tan"]],
                        gridline_y = TRUE,
                        gridline_x = TRUE,
                        ...) {
  if (!isNamespaceLoaded("extrafont")) {
    cli::cli_warn(c(
      "The extrafont package is not loaded.",
      "Call `library(extrafont)`."
    ))
  }

  # Set up gridline variables

  gridline_y <- if (isTRUE(gridline_y)) {
    ggplot2::element_line(
      color = color_gridline, linewidth = 0.25
    )
  } else {ggplot2::element_blank()}

  gridline_x <- if (isTRUE(gridline_x)) {
    ggplot2::element_line(
      color = color_gridline, linewidth = 0.25
    )
  } else {ggplot2::element_blank()}

  # Set up theme based on theme_minimal

  ggplot2::theme_minimal() %+replace%

    ggplot2::theme(
      plot.title = ggplot2::element_text(
        family = font_title,
        size = 14 * text_scale,
        face = "bold",
        color = color_title,
        margin = ggplot2::margin(b = 6),
        hjust = 0
      ),

      # This sets the font, size, type and color of text for the
      # chart's subtitle, as well as setting a margin between the
      # title and the subtitle
      plot.subtitle = ggplot2::element_text(
        family = font_subtitle,
        size = 12 * text_scale,
        face = "bold",
        color = color_title,
        margin = ggplot2::margin(b = 15),
        hjust = 0
      ),
      plot.caption = ggplot2::element_text(
        family = font_caption,
        size = 9 * text_scale,
        color = color_caption,
        margin = ggplot2::margin(t = 6),
        hjust = 1, vjust = 1
      ),
      plot.margin = ggplot2::margin(t = 15, r = 15, b = 10, l = 15),
      plot.title.position = "plot", # Move plot.title to the left
      plot.caption.position = "plot",

      # Legend format
      # Set the legend to be at the top left of the graphic, below title
      legend.position = legend_position,
      legend.text.align = 0,
      legend.background = ggplot2::element_blank(),
      legend.margin = ggplot2::margin(t = 5, r = 5, b = 5, l = 5),
      legend.key = ggplot2::element_blank(),
      legend.title = ggplot2::element_text(
        family = font_plot,
        size = 11 * text_scale,
        face = "bold",
        color = color_plot_text
      ),
      legend.text = ggplot2::element_text(
        family = font_plot,
        size = 11 * text_scale,
        color = color_plot_text
      ),

      # Axis format
      axis.text = ggplot2::element_text(
        family = font_plot,
        size = 10 * text_scale,
        color = color_plot_text
      ),
      axis.ticks = ggplot2::element_blank(),
      axis.line = ggplot2::element_blank(),
      axis.title = ggplot2::element_text(
        family = font_plot,
        size = 10 * text_scale,
        color = color_plot_text
      ),
      axis.title.y = ggplot2::element_text(
        angle = 90,
        margin = ggplot2::margin(t = 0, r = 15, b = 0, l = 0)
      ),
      axis.title.x = ggplot2::element_text(
        margin = ggplot2::margin(t = 0, r = 0, b = 0, l = 0)
      ),

      # Grid lines
      panel.grid.minor = ggplot2::element_blank(),
      panel.grid.major.y = gridline_y,
      panel.grid.major.x = gridline_x,

      # Blank background
      panel.background = ggplot2::element_blank(),
      panel.border = ggplot2::element_blank(),
      panel.spacing = ggplot2::unit(facet_space, "lines"),

      # Plot fill and margins
      plot.background = ggplot2::element_rect(
        fill = "white", color = NA
      ),

      # Facet strip background and text
      strip.background = ggplot2::element_blank(),
      strip.text = ggplot2::element_text(
        family = font_plot,
        face = "bold",
        size = 11 * text_scale,
        hjust = 0.5,
        margin = ggplot2::margin(t = 4, r = 4, b = 4, l = 4)
      ),
      ...
    )
}
