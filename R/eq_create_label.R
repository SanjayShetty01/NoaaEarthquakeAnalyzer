#' Function to create a pop-up of text
#'
#' @param data A Dataframe
#' @return A leaflet map with pop-up text containing location name, magnitude and total deaths
#'
#'
#' @examples
#' \dontrun{
#' data = system.file('extdata', 'earthquakesData.tsv', package ='masteringSoftwareDevelopmentinR') %>%
#' data = read_data(data) %>%
#' eq_clean_data() %>%
#'  dplyr::filter(COUNTRY == "MEXICO" & lubridate::year(DATE) >= 2000) %>%
#'  dplyr::mutate(popup_text = eq_create_label(.)) %>%
#'  eq_map(annot_col = "popup_text")
#'  }
#'
#' @export

eq_create_label <- function(data){

label = paste(ifelse(is.na(data$Location.Name),"",
                    paste("<b>Location: </b>",data$Location.Name,"<br/>")),
        ifelse(is.na(data$Mag),"",
                    paste("<b>Magnitude: </b>",data$Mag,"<br/>")),
        ifelse(is.na(data$Total.Deaths),"",
                    paste("<b>Total deaths: </b>",data$Total.Deaths,"<br/>")))

labeled = stringi::stri_c(label)

return(labeled)
}



