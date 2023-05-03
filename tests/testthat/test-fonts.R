test_that("washi_install_fonts() works", {
  skip_on_ci()
  expect_message(washi_install_fonts())
})

test_that("washi_register_fonts() works", {
  skip_on_ci()
  expect_message(washi_register_fonts())
})
