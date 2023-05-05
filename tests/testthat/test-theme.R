test_that("washi_theme() works", {
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
    washi_theme()

  # Check that a ggplot object is returned
  expect_true(ggplot2::is.ggplot(plot))

  # Check a snapshot
  skip_on_ci()
  vdiffr::expect_doppelganger(title = "washi_theme",
                              fig = plot)
})
