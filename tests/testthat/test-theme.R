test_that("washi_theme() works", {

  # NOTE: These tests do not use Poppins or Lato in order to pass
  # automated checks on computers without these fonts installed.

  data <- data.frame(a = 1:5,
                     b = 6:10,
                     c = c(rep("a", 2), rep("b", 2), "c"))

  plot <- ggplot2::ggplot(
    data,
    ggplot2::aes(x = a,
                 y = b,
                 color = c
    )
  ) +
    ggplot2::geom_point() +
    washi_theme(font_header = "sans", font_body = "sans")

  # Check that a ggplot object is returned
  expect_true(ggplot2::is.ggplot(plot))

  # Check that gridline_y = FALSE and gridline_x = FALSE work
  theme <- washi_theme(font_header = "sans", font_body = "sans",
                       gridline_y = FALSE, gridline_x = FALSE)
  expect_equal(length(theme$panel.grid.major.x), 0)
  expect_equal(length(theme$panel.grid.major.y), 0)

  # Check a snapshot
  vdiffr::expect_doppelganger(title = "washi_theme",
                              fig = plot)

  # Check that invalid input to font_header errors
  expect_error(
    washi_theme(font_header = "asdf",
                font_body = "sans"),
    "font database"
  )

  # Check that invalid input to font_body errors
  expect_error(
    washi_theme(font_body = "asdf",
                font_header = "sans"),
    "font database"
  )

  # Check that multiple args to legend_position errors
  expect_error(
    washi_theme(legend_position = c("top", "bottom"),
                font_header = "sans", font_body = "sans"),
    "must have length 1"
  )

  # Check that invalid legend_position errors
  expect_error(
    washi_theme(legend_position = "hello",
                font_header = "sans", font_body = "sans"),
    "must be one of"
  )

  # Check that invalid gridline_x errors
  expect_error(
    washi_theme(gridline_x = "hello",
                font_header = "sans", font_body = "sans"),
    "must be TRUE or FALSE"
  )

  # Check that invalid gridline_y errors
  expect_error(
    washi_theme(gridline_y = "hello",
                font_header = "sans", font_body = "sans"),
    "must be TRUE or FALSE"
  )

})
