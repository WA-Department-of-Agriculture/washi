test_that("scale_washi() works", {
  # Check that a ScaleDiscrete object is returned
  expect_s3_class(scale_washi(), "ScaleDiscrete")

  # Check that discrete = FALSE works
  expect_s3_class(scale_washi(discrete = FALSE),
                  "ScaleContinuous")

  # Check that a ggplot object is returned
  plot <- ggplot2::ggplot(
    iris,
    ggplot2::aes(Sepal.Width,
      Sepal.Length,
      color = Species
    )
  ) +
    ggplot2::geom_point() +
    scale_washi()

  expect_true(ggplot2::is.ggplot(plot))

  # Check that alpha > 1 errors
  expect_error(scale_washi(alpha = 5))
})
