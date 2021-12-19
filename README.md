#  NOAA_Earthquake_Analyzer

 <!-- badges: start -->
  [![R-CMD-check](https://github.com/SanjayShetty01/NoaaEarthquakeAnalyzer/workflows/R-CMD-check/badge.svg)](https://github.com/SanjayShetty01/NoaaEarthquakeAnalyzer/actions)
  <!-- badges: end -->

### NOAA_Earthquake_Analyzer Package

The package can be used to read, clean the data and visualize the 
data from the [NOAA Significant Earthquake Database](https://www.ngdc.noaa.gov/nndc/struts/form?t=101650&s=1&d=1). 
All the operations are done as per the instructions given in 
the [Coursera: Mastering Software Development in R Capstone Course](https://www.coursera.org/learn/r-capstone/home/welcome)

### Installation

To load the package. You must first install `devtools` package from CRAN.


```{r, eval=FALSE}
install.packakes('devtools') # installing devtools

devtools::install_github('SanjayShetty01/NOAA_Earthquake_Analyzer')
```

### Usage

The NOAA dataset is already loaded in the package as `earthquakesdata`. But if
you have a downloaded `.tsv` raw dataset from the NOAA wesite. then you could use
`read_data` function to read the dataset unto the R environment and load it as a
r dataframe.

`eq_clean_data` : The function removes un-wanted columns, creates a DATE column
and also cleans the location column.

`geom_timeline` : This function creates ggplot visualization of the timelines of
occurrence of earthquake in the specified country (or countries) (use `y`
variable to specify the country of interest `[more in the vignettes folder]`)

`geom_timeline_label` : The function creates a annotation of the location of the
earthquake over the timeline visualization of the data.

`eq_map` : The function creates a leaflet map (interactive) of the location of
the earthquakes and you would specify which column to be shown as a pop-up text.

`eq_create_label` : The function creates a string vector for the `eq_map`
function, which displays the important information (location, magnitude and total
amount of deaths due to the earthquakes.) on the leaflet map.
