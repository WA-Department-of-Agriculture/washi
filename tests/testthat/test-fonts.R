test_that("washi_install_fonts() works", {
  skip_on_ci()
  skip_on_cran()
  expect_message(washi_install_fonts())
})

