library(testthat)



data = system.file('extdata', 'earthquakesData.tsv', package ='NoaaEarthquakeAnalyzer')
data = read_data(data)
cleanedData <- eq_clean_data(data)

map = eq_map('Location.Name', cleanedData)

test_that("the output is a leaflet",{

  expect_s3_class(map, "leaflet")
})
