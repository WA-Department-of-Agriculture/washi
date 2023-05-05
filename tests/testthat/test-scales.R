test_that("washi_scale() works", {
  # Check that a ScaleDiscrete object is returned
  expect_s3_class(washi_scale(), "ScaleDiscrete")

  # Check that discrete = FALSE works
  expect_s3_class(
    washi_scale(discrete = FALSE),
    "ScaleContinuous"
  )

  # Check that a ggplot object is returned
  data <- data.frame(a = 1:5,
                     b = 6:10,
                     c = c(rep("a", 2), rep("b", 2), "c"))

  # Check that a ggplot object is returned
  plot <- ggplot2::ggplot(
    data,
    ggplot2::aes(x = a,
                 y = b,
                 color = c
    )
  ) +
    ggplot2::geom_point() +
    washi_scale()

  expect_true(ggplot2::is.ggplot(plot))

  # Check that alpha > 1 errors
  expect_error(
    washi_scale(alpha = 5),
    "Alpha must be between 0 and 1."
  )

  # Check that non-logical discrete errors
  expect_error(
    washi_scale(discrete = "a"),
    "`discrete` must be `TRUE` or `FALSE`."
  )

  # Check a snapshot
  vdiffr::expect_doppelganger(title = "washi_scale",
                              fig = plot)
})
