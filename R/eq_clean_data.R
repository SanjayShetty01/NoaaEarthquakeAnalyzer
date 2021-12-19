#' The function Cleans the data for further analysis.
#'
#' @param data A Dataframe
#' @return  A Dataframe
#' @details
#' We would clean the data by
#'
#' first creating a DATE column, which would be contain the Year,Month and Day
#' merged together in ymd format
#' The column `Search Parameter` contains no items, hence it would also be removed
#' The COUNTRY column would contain the country entry from the `Location Name` column
#' The 'Location.Name' would contain the city or region name from the `Location Name` column
#'
#' @import lubridate
#' @import dplyr
#' @import stringr
#' @import stringi
#'
#' @examples
#' \dontrun{
#' data = system.file('extdata', 'earthquakesData.tsv', package ='masteringSoftwareDevelopmentinR')
#' data = read_data(data)
#' cleanedData <- eq_clean_data(data)
#'}
#'@export



eq_clean_data <- function(data){

# Convert date from character to date format

    data$DATE <- paste(data$Year,
                     data$Mo,
                     data$Dy, sep = '/')
    data$DATE <- lubridate::ymd(data$DATE)

# remove first column which contains only NA values

  data <- within(data, rm(`Search Parameters`))

# Convert the latitude and Longitude column to numeric format
  data$Latitude <- as.numeric(data$Latitude)
  data$Longitude <- as.numeric(data$Longitude)


eq_location_clean <-function(data){

# Keep only the City name. (removing country reference from the location column)

locationCleaned_data = data %>%
      dplyr::mutate(COUNTRY = stringr::str_extract(`Location Name`, "(.*?):")) %>%
      dplyr::mutate(COUNTRY = stringr::str_replace_all(COUNTRY, "[[:punct:]]", " ")) %>%
      dplyr::mutate(COUNTRY = stringi::stri_trim(COUNTRY)) %>%
      dplyr::mutate(Location.Name= stringr::str_remove(`Location Name`,"^.*:")) %>%
      dplyr::mutate(Location.Name = stringi::stri_trim(`Location.Name`))

  return(locationCleaned_data)
}


data = eq_location_clean(data)

return(data)
}

