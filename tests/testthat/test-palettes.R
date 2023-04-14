test_that("washi_pal works", {
  # Check that hex codes can be extracted from washi_pal
  expect_equal(washi_pal[["standard"]][["green"]], "#023b2c")
})

test_that("washi_pal_setup() works", {
  # Check that it works even without choosing `n` colors
  expect_equal(
    washi_pal_setup("standard"),
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
    washi_pal_setup("color_blind", reverse = TRUE),
    c("#D3CF9D", "#7C7979", "#700004", "#7AB7C6", "#FCB040", "#03634A")
  )

  # Check that an unavailable palette errors
  expect_error(
    washi_pal_setup("foo"),
    "There is no palette called"
  )
})

# Check that non-numeric n errors
expect_error(
  washi_pal_setup(n = "a"),
  "`n` must be numeric."
)

# Check that non-logical reverse errors
expect_error(
  washi_pal_setup(reverse = "a"),
  "`reverse` must be `TRUE` or `FALSE`."
)

test_that("washi_pal_view() works", {
  vdiffr::expect_doppelganger(
    title = "washi_pal_view",
    fig = washi_pal_view("standard")
  )
})
