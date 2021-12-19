#' A Function to create map to visualize the earthquake Dataset
#'
#' @param annot_col A charater
#' @param data A Dataframe
#'
#' @return A leaflet Map
#'
#' @import leaflet
#'
#' @examples
#' \dontrun{
#'data = system.file('extdata', 'earthquakesData.tsv', package ='masteringSoftwareDevelopmentinR')
#'
#' eq_map(eq_clean_data(read_data(data)))
#' }
#'
#' @export

eq_map <- function(annot_col, data){

  #removing NA values from Latitude and Longitude
  data = data[!is.na(data$Latitude),]
  data = data[!is.na(data$Longitude),]

data %>%
  leaflet::leaflet() %>%
    leaflet::addTiles() %>%
    leaflet::addCircleMarkers(lng = ~Longitude, lat = ~Latitude,
                              radius = ~Mag,
                              popup = data[[annot_col]]
                              )
}



