#' The function reads the data
#'
#' @param filename A character
#' @return the file as a dataframe
#'
#' @import readr
#'
#' @examples
#' \dontrun{
#' data = system.file('extdata', 'earthquakesData.tsv', package ='masteringSoftwareDevelopmentinR')
#' data = read_data(data)
#' }
#'
#' @export


read_data <-  function(filename){

# Checking if the data file exists or not.
              if(!file.exists(filename)){
                stop("'file: ", filename, " doesn't exist'")
              }
# Reading the data if the data file exists
              else{
                data <- suppressMessages(
                  readr::read_tsv(filename,

                ))
              }

return(data)
}






