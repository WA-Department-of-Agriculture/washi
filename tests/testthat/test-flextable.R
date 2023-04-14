test_that("washi_flextable() works", {
  ft <- washi_flextable(head(mtcars))
  expect_s3_class(ft, "flextable")
})
