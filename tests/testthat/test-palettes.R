test_that("palettes_washi works", {
  # Check that hex codes can be extracted from palettes_washi
  expect_equal(palettes_washi[["standard"]][["green"]], "#023b2c")
})

test_that("palette_setup() works", {
  # Check that it works even without choosing `n` colors
  expect_equal(
    palette_setup("standard"),
    c(
      "#023B2C",
      "#335C67",
      "#A60F2D",
      "#FCB040",
      "#3E3D3D",
      "#7C7979",
      "#CCC29C",
      "#F2F0E6"
    )
  )

  # Check that reverse works
  expect_equal(
    palette_setup("color_blind", reverse = TRUE),
    c("#D3CF9D", "#7C7979", "#700004", "#7AB7C6", "#FCB040", "#03634A")
  )

  # Check that an unavailable palette errors
  expect_error(palette_setup("foo"))
})

test_that("palette_view() works", {
  vdiffr::expect_doppelganger(
    title = "palette_view",
    fig = palette_view("standard")
  )
})
