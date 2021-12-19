library(testthat)
library(ggplot2)


data = system.file('extdata', 'earthquakesData.tsv', package ='NoaaEarthquakeAnalyzer')
data = read_data(data)
cleanedData <- eq_clean_data(data)

g <- ggplot(cleanedData)+
    geom_timeline_label(aes(x = c(date,Location.Name),
                size = Mag,
                color = Deaths,
                fill = Deaths))

test_that("The output is ggplot", {
  expect_s3_class(g, "ggplot")
})
