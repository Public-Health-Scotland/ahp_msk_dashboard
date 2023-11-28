####################### Setup for the Geospatial packages #######################

# Set environment variables to point to installations of geospatial libraries ----

# 1 - Amend 'LD_LIBRARY_PATH' ----

# Get the existing value of 'LD_LIBRARY_PATH'
old_ld_path <- Sys.getenv("LD_LIBRARY_PATH") 

# Append paths to GDAL and PROJ to 'LD_LIBRARY_PATH'
Sys.setenv(LD_LIBRARY_PATH = paste(old_ld_path,
                                   "/usr/gdal34/lib",
                                   "/usr/proj81/lib",
                                   sep = ":"))

rm(old_ld_path)


# 2 - Specify additional proj path in which pkg-config should look for .pc files ----

Sys.setenv("PKG_CONFIG_PATH" = "/usr/proj81/lib/pkgconfig")

# 3 - Specify the path to GDAL data ----

Sys.setenv("GDAL_DATA" = "/usr/gdal34/share/gdal")


# 4 - Load the geospatial libraries so that R can see them ----

dyn.load("/usr/gdal34/lib/libgdal.so")
dyn.load("/usr/geos310/lib64/libgeos_c.so", local = FALSE)


# 5 - Load libraries ----

library(dplyr)

# Mapping Packages ####
# For installation instructions see the following link (shift + left click to open)

# https://public-health-scotland.github.io/knowledge-base/docs/Posit%20Infrastructure?doc=How%20to%20Install%20and%20Use%20Geospatial%20R%20Packages.md

# leaflet documentation can be found here: https://rstudio.github.io/leaflet/
library(leaflet) 

# unlike rgdal, sf follows a dataframe like structure with the "geometry" column holding the shape data
library(sf)        # For reading in shapefiles
library(readxl)    # For reading in Excel files
library(readr)     # For reading in csv files

### End of Geospatial packages 

# Shiny packages ----
library(shiny)
library(shinycssloaders)
library(shinydashboard)

# Data wrangling packages ----
#library(dplyr)
library(magrittr)
#library(readr)
library(shinyWidgets)
library(tidyr)
library(purrr)

# Plotting packages ----
library(plotly)
library(ggplot2)

# PHS styling packages ----
library(phsstyles)

# Load core functions ----
source("functions/core_functions.R")

## Plotting ----
# Style of x and y axis
xaxis_plots <- list(title = FALSE, tickfont = list(size=14), titlefont = list(size=14),
                    showline = TRUE, fixedrange=TRUE)

yaxis_plots <- list(title = FALSE, rangemode="tozero", fixedrange=TRUE, size = 4,
                    tickfont = list(size=14), titlefont = list(size=14))

# Buttons to remove from plotly plots
bttn_remove <-  list('select2d', 
                     'lasso2d', 
                     'zoomIn2d', 
                     'zoomOut2d',
                     'autoScale2d',   
                     'toggleSpikelines',  
                     'hoverCompareCartesian',
                     'hoverClosestCartesian')

# LOAD IN DATA HERE ----

# Read in data 
Join_all_long2 <- read_csv("data/Join_all_long2.csv",show_col_types = FALSE)
Referrals <- read_csv("data/Refs_data.csv",show_col_types = FALSE)
Seen <- read_csv("data/Seen_data.csv",show_col_types = FALSE)
Waiting <- read_csv("data/Wait_data.csv",show_col_types = FALSE) 
Removals <- read_csv("data/Removals_data.csv",show_col_types = FALSE)
dq <- read_csv("data/dq-text.csv",show_col_types = FALSE)
map_dataSHP <- read_sf('data/SG_NHS_IntegrationAuthority_2019.shp') %>% 
  # converts the shapefile to use latitude and longitude
  st_transform(4326)  #EPSG4326
lookup_board_hscp <- read_csv("data/lookup_board_hscp.csv")
hscp_map_data <- read_csv("data/hscp_map_data.csv")

# Setting up vector for data download page
data_list_data_tab <- c("NHS Board chart data" = "Join_all_long2",
                        "Referrals" = "Referrals",
                        "Removals" = "Removals",
                        "Patients Seen" = "Seen",
                        "Patients Waiting" = "Waiting",
                        "Patients Seen by HSCP" = "hscp_map_data"
                        )






