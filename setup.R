####################### Setup #######################

# Shiny packages ----
library(shiny)
library(shinycssloaders)

# Data wrangling packages ----
library(dplyr)
library(magrittr)
library(readr)
library(shinyWidgets)
library(tidyr)

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
bttn_remove <-  list('select2d', 'lasso2d', 'zoomIn2d', 'zoomOut2d',
                     'autoScale2d',   'toggleSpikelines',  'hoverCompareCartesian',
                     'hoverClosestCartesian')

# LOAD IN DATA HERE ----

# Read in data for waiting_list_chart
Join_all_long2 <- read_csv("data/Join_all_long2.csv",show_col_types = FALSE)
