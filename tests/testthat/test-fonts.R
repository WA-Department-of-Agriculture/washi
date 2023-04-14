test_that("washi_import_fonts() works", {

  # Function to check if fonts are installed
  fonts_installed <- function() {
    all(c("Lato", "Poppins") %in% extrafont::fonts())
  }
  # Expect success message if fonts are newly imported
  if (!fonts_installed()) {
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
  expect_true(fonts_installed())
})
