test_that("washi_import_fonts() works", {
  washi_import_fonts()
  expect_true("Lato" %in% extrafont::fonts())
  expect_true("Poppins" %in% extrafont::fonts())
})
