#' Example data in long (tidy) format
#'
#' A subset WaSHI State of the Soils Assessment dataset that has been
#' anonymized. This dataset is tidied, so each measurement is in its
#' own row.
#'
#' @format ## `example_data_long` A data frame with 1,800 rows and 14 columns:
#' \describe{
#'   \item{year}{Year of sample}
#'   \item{sampleId, producerId, fieldId}{Anonymized IDs}
#'   \item{farmName, producerName, fieldName}{Anonymized names}
#'   \item{longitude, latitude}{Truncated coordinates}
#'   \item{texture}{Measured soil texture}
#'   \item{measurement}{Measurement name with units}
#'   \item{value}{Measurement result}
#'   ...
#' }
#' @source
#'   <https://agr.wa.gov/departments/land-and-water/natural-resources/soil-health/state-of-the-soils>
"example_data_long"

#' Example data in wide format
#'
#' A subset WaSHI State of the Soils Assessment dataset that has been
#' anonymized. This dataset presents each sample in its own row, with
#' columns for each measurement.
#'
#' @format ## `example_data_wide` A data frame with 30 rows and 72
#'   columns:
#' \describe{
#'   \item{year}{Year of sample}
#'   \item{sampleId, producerId, fieldId}{Anonymized IDs}
#'   \item{farmName, producerName, fieldName}{Anonymized names}
#'   \item{longitude, latitude}{Truncated coordinates}
#'   \item{texture}{Measured soil texture}
#'   \item{other columns}{Column name includes measurement and units; value is the measurement results}
#'   ...
#' }
#' @source
#' <https://agr.wa.gov/departments/land-and-water/natural-resources/soil-health/state-of-the-soils>
"example_data_wide"
