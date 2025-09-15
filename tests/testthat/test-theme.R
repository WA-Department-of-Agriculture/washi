test_that("washi_theme() works", {
  # NOTE: These tests do not use Poppins or Lato in order to pass
  # automated checks on computers without these fonts installed.

  data <- data.frame(
    a = 1:5,
    b = 6:10,
    c = c(rep("a", 2), rep("b", 2), "c")
  )

  plot <- ggplot2::ggplot(
    data,
    ggplot2::aes(
      x = a,
      y = b,
      color = c
    )
  ) +
    ggplot2::geom_point() +
    washi_theme()

  # Check that a ggplot object is returned
  expect_true(ggplot2::is_ggplot(plot))

  # Check that gridline_y = FALSE and gridline_x = FALSE work
  theme <- washi_theme(
    gridline_y = FALSE,
    gridline_x = FALSE
  )
  expect_s7_class(theme$panel.grid.major.x, ggplot2::element_blank)
  expect_s7_class(theme$panel.grid.major.y, ggplot2::element_blank)

  # Check a snapshot
  vdiffr::expect_doppelganger(
    title = "washi_theme",
    fig = plot
  )

  # Check that invalid input to header_font errors
  expect_message(
    washi_theme(
      header_font = "asdf"
    ),
    "Couldn't find"
  )

  # Check that invalid input to body_font errors
  expect_message(
    washi_theme(
      body_font = "asdf"
    ),
    "Couldn't find"
  )

  # Check that multiple args to legend_position errors
  expect_error(
    washi_theme(
      legend_position = c("top", "bottom")
    ),
    "must have length 1"
  )

  # Check that invalid legend_position errors
  expect_error(
    washi_theme(
      legend_position = "hello"
    ),
    "must be one of"
  )

  # Check that invalid gridline_x errors
  expect_error(
    washi_theme(
      gridline_x = "hello"
    ),
    "must be TRUE or FALSE"
  )

  # Check that invalid gridline_y errors
  expect_error(
    washi_theme(
      gridline_y = "hello"
    ),
    "must be TRUE or FALSE"
  )
})
