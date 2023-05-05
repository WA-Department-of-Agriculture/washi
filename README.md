
<!-- README.md is generated from README.Rmd. Please edit that file -->

# washi

<!-- badges: start -->

<a href="https://www.repostatus.org/#wip"><img src="https://www.repostatus.org/badges/latest/wip.svg" alt="Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public."/></a>
[![R-CMD-check](https://github.com/WA-Department-of-Agriculture/washi/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/WA-Department-of-Agriculture/washi/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/WA-Department-of-Agriculture/washi/branch/main/graph/badge.svg)](https://app.codecov.io/gh/WA-Department-of-Agriculture/washi?branch=main)

<!-- badges: end -->

Inspired by other branding R packages such as
[`glitr`](https://github.com/USAID-OHA-SI/glitr),
[`ratlas`](https://github.com/atlas-aai/ratlas), and
[`nmfspalette`](https://github.com/nmfs-fish-tools/nmfspalette), `washi`
provides color palettes and themes consistent with Washington Soil
Health Initiative (WaSHI) branding. This package is to be used only by
direct collaborators within WaSHI, though you are welcome to adapt the
package to suit your own organization’s branding.

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

Individual colors can be accessed with
`washi_pal[["standard"]][["green"]]`.

``` r
washi_pal_view("standard")
```

<img src="man/figures/README-standard-1.png" width="100%" />

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

### Data

`washi` provides an example dataset, which was subset and anonymized
from the [WaSHI State of the Soils
Assessment](https://agr.wa.gov/departments/land-and-water/natural-resources/soil-health/state-of-the-soils).
This dataset comes in a long, tidy form with one measurement per row;
and in a wide form with one sample per row. Its purpose is to provide an
example soils dataset to use in plots and tables.

### Plots

`washi` provides `ggplot2` scale and theme functions that apply WaSHI
colors, fonts, and styling.

**Example workflow:**

``` r
library(extrafont) # Package must be loaded to use WaSHI fonts
#> Registering fonts with R
library(ggplot2)

# 1. Prepare data
example_data_long |>
  subset(measurement %in% c("totalC_%", "poxC_mg.kg") &
    !texture == "Loamy Sand") |>
  # 2. Pipe to ggplot()
  ggplot(aes(x = value, fill = texture, color = texture)) +
  labs(
    title = "washi_theme() + washi_scale()",
    subtitle = "Example of facet_grid()."
  ) +
  geom_density(alpha = 0.4) +
  facet_wrap(. ~ measurement, scales = "free") +
  # 3. Add washi_theme() with argument to change legend position
  washi_theme(legend_position = "bottom") +
  # 4. Add washi_scale()
  washi_scale() +
  # 5. Tweak for your specific plot
  xlab(NULL) +
  guides(col = guide_legend(nrow = 2, byrow = TRUE))
```

<img src="man/figures/README-plot-1.png" width="100%" />

### Tables

`washi` provides a function to create a `flextable` with WaSHI colors,
fonts, and styling.

``` r
ft <- example_data_wide |>
  head(5) |> 
  subset(select = c("sampleId", 
                    "crop", 
                    "totalN_%", 
                    "totalC_%")) |>
  washi_flextable(cols_bold = 1)
```

![](man/figures/README-table-1.png)
