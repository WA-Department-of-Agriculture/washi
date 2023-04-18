test_that("washi_check_fonts() works", {
  # Check type
  expect_type(washi_check_fonts(), "logical")

  # Check warning if fonts not already imported
  skip_if(washi_check_fonts(), message = "Fonts already imported.")
  expect_warning(washi_check_fonts(),
                 "Fonts not imported. Call `washi_import_fonts()`.")
})

test_that("washi_import_fonts() works", {
  # Expect success message if fonts are newly imported
  if (isFALSE(washi_check_fonts())) {
    expect_message(
      washi_import_fonts(),
      "imported"
    )
  } else {
    # Otherwise expect message that fonts are already installed
    expect_message(
      washi_import_fonts(),
      "already on your system"
    )
  }
  # Check that both fonts are installed
  expect_true(washi_check_fonts())
})
