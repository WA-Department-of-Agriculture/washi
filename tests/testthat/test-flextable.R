test_that("washi_flextable() works", {
  data <- data.frame(a = 1:5, b = 6:10)
  ft <- washi_flextable(data, cols_bold = 1)

  # Check the class
  expect_s3_class(ft, "flextable")

  # Check a snapshot
  vdiffr::expect_doppelganger(
    title = "washi_flextable",
    fig = ft
  )

  # Check that character input to cols_bold errors
  expect_error(
    washi_flextable(data, cols_bold = "a"),
    "numeric"
  )

  # Check that numeric input to header_font_color errors
  expect_error(
    washi_flextable(data, header_font_color = 1),
    "character"
  )

  # Check that numeric input to header_bg_color errors
  expect_error(
    washi_flextable(data, header_bg_color = 1),
    "character"
  )
})
