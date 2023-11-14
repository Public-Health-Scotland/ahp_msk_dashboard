####################### Setup #######################

# Shiny packages ----
library(shiny)
library(shinycssloaders)
library(shinydashboard)

# Data wrangling packages ----
library(dplyr)
library(magrittr)
library(readr)
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

# Setting up vector for data download page
data_list_data_tab <- c("Referrals" = "Referrals",
                        "Patients Seen" = "Seen",
                        "Patients Waiting" = "Waiting",
                        "Removals" = "Removals", 
                        "NHS Board chart data" = "Join_all_long2")






