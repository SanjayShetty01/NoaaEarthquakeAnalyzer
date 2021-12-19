library(testthat)
library(ggplot2)


data = system.file('extdata', 'earthquakesData.tsv', package ='NoaaEarthquakeAnalyzer')
data = read_data(data)
cleanedData <- eq_clean_data(data)

test_that('output is a ggplot',{
  g = ggplot(cleanedData,aes(x = datetime,
                        size = Mag,
                        color = DEATHS,
                        fill = DEATHS))
  expect_s3_class(g, 'ggplot')
})

