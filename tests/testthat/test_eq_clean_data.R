library(testthat)


data = system.file('extdata', 'earthquakesData.tsv', package ='NoaaEarthquakeAnalyzer')
data = read_data(data)
cleanedData <- eq_clean_data(data)


test_that("output is a dataframe", {

expect_s3_class(cleanedData, "data.frame")
})

test_that("column is a date" ,{
  columnDate <- cleanedData$DATE

  expect_s3_class(columnDate, 'Date')
})


test_that("lat and long columns are converted to class numeric or type double",{
  columnLat <- cleanedData$Latitude
  columnLong <- cleanedData$Longitude

  expect_type(columnLat, 'double')
  expect_type(columnLong, 'double')
})

