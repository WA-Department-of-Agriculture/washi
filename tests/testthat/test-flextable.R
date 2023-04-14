test_that("washi_flextable() works", {
  ft <- washi_flextable(head(mtcars), cols_bold = 1)
  expect_s3_class(ft, "flextable")

  vdiffr::expect_doppelganger(
    title = "washi_flextable",
    fig = ft
  )

  # Check that character input to cols_bold errors
  expect_error(
    washi_flextable(head(mtcars), cols_bold = "a"),
    "numeric"
  )

  # Check that numeric input to header_font_color errors
  expect_error(
    washi_flextable(head(mtcars), header_font_color = 1),
    "character"
  )

  # Check that numeric input to header_bg_color errors
  expect_error(
    washi_flextable(head(mtcars), header_bg_color = 1),
    "character"
  )
})
