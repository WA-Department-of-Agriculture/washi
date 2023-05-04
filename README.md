
<!-- README.md is generated from README.Rmd. Please edit that file -->

# washi

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/WA-Department-of-Agriculture/washi/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/WA-Department-of-Agriculture/washi/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/WA-Department-of-Agriculture/washi/branch/main/graph/badge.svg)](https://app.codecov.io/gh/WA-Department-of-Agriculture/washi?branch=main)

<!-- badges: end -->

Inspired by other branding R packages such as
[`glitr`](https://github.com/USAID-OHA-SI/glitr),
[`ratlas`](https://github.com/atlas-aai/ratlas), and
[`nmfspalette`](https://github.com/nmfs-fish-tools/nmfspalette), `washi`
provides color palettes and themes consistent with Washington Soil
Health Initiative (WaSHI) branding.

## Installation

You can install the development version of washi from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
# devtools::install_github("WA-Department-of-Agriculture/washi")
library(washi)
```

## Requirements

### Install and register fonts

`washi` uses Poppins and Lato fonts. You can install these on your
computer by running:

``` r
washi_install_fonts()
```

This function will open a window with the font files for you to install,
and provides instructions for installation. Once they are installed, you
will need to register them for use in R with:

``` r
washi_register_fonts()
```

Then restart your R session (Ctrl + Shift + F10).

## Palettes

To list the names of all available palettes, call `names(washi_pal)`. To
view a palette, use the `washi_pal_view()` function.

#### All WaSHI standard colors

This palette is primarily to access individual brand colors for fonts,
table headers, graphic backgrounds, etc. These colors are not accessible
to those who may have color blindness.

``` r
washi_pal_view("standard")
```

<img src="man/figures/README-standard-1.png" width="100%" />

Individual colors can be accessed with
`washi_pal[["standard"]][["green"]]`.

#### WaSHI colors adjusted to be color-blind safe

``` r
washi_pal_view("color_blind")
```

<img src="man/figures/README-color_blind-1.png" width="100%" />

#### Color gradients

Available in green, blue, red, and gold.

``` r
washi_pal_view("green_gradient", n = 4, reverse = TRUE)
```

<img src="man/figures/README-green_gradient-1.png" width="100%" />
