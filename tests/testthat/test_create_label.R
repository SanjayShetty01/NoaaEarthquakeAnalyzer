library(testthat)

data = system.file('extdata', 'earthquakesData.tsv', package ='NoaaEarthquakeAnalyzer')
data = read_data(data)
cleanedData <- eq_clean_data(data)

test_that('the output is a string (character) vector', {
    label = eq_create_label(cleanedData)

    expect_type(label, "character")
})


