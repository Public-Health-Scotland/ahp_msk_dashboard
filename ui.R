##########################################################
# ahp_app
# Original author(s): Original author(s)
# Original date: 2023-09-20
# Written/run on RStudio server 2022.7.2.576.12 and R 4.1.2
# Description of content
##########################################################


# Get packages
source("setup.R")

# UI
ui <- fluidPage(
  tagList(
    # Specify most recent fontawesome library - change version as needed
    tags$style("@import url(https://use.fontawesome.com/releases/v6.1.2/css/all.css);"),
    navbarPage(
      id = "intabset", # id used for jumping between tabs
      title = div(
        tags$a(img(src = "phs-logo.png", height = 40),
               href = "https://www.publichealthscotland.scot/",
               target = "_blank"), # PHS logo links to PHS website
        style = "position: relative; top: -5px;"),
      windowTitle = "ahp_app",# Title for browser tab
      header = tags$head(includeCSS("www/styles.css"),  # CSS stylesheet
                         tags$link(rel = "shortcut icon", href = "favicon_phs.ico") # Icon for browser tab
      ), 
      ##############################################.
      # INFORMATION PAGE ----
      ##############################################.
      tabPanel(title = "Information",
               icon = icon_no_warning_fn("circle-info"),
               value = "intro",
               
               h1("Allied Health Professional Musculoskeletal (AHP MSK)"),
               uiOutput("intro_page_ui") 
               
      ), # tabpanel
      ##############################################.
      # NOTES PAGE ----
      ##############################################.
      tabPanel(title = "Notes",
               icon = icon_no_warning_fn("clipboard"),
               value = "intro",
               
               h1("Data quality and completeness"),
               uiOutput("notes_page_ui") 
               
      ), # tabpanel
      ##############################################.
      # NHS BOARD PAGE ----
      ##############################################.
      tabPanel(title = "NHS Board",
               icon = icon_no_warning_fn("hospital"),
               value = "intro",
               
              
      source(file.path("pages/board_page_ui.R"), local = TRUE)$value
               
      ), # tabpanel
      ##############################################.
      # SPECIALTY PAGE ----
      ##############################################.
      tabPanel(title = "Specialty",
               icon = icon_no_warning_fn("user-doctor"),
               value = "intro",
               
               h1("View data by Specialty"),
               
               
      ), # tabpanel
      ##############################################.
      # MAP PAGE ----
      ##############################################.
      tabPanel(title = "Map",
               icon = icon_no_warning_fn("location-dot"),
               value = "intro",
               
               h1("View data by Health and Social Care Partnership"),
               
               
      ), # tabpanel
      ##############################################.
      # DATA PAGE ----
      ##############################################.
      tabPanel(title = "Data",
               icon = icon_no_warning_fn("table"),
               value = "intro",
               
               #h1("Download the data"),
               
      source(file.path("pages/download_page_ui.R"), local = TRUE)$value         
               
               
      ), # tabpanel
      ##############################################.
      # PAGE 1 ----
      ##############################################.
      tabPanel(title = "Page 1",
               # Look at https://fontawesome.com/search?m=free for icons
               icon = icon_no_warning_fn("stethoscope"),
               value = "intro",
               
               h1("Page 1 title"),
               uiOutput("page_1_ui"),
               linebreaks(2),
               h2("An example plot using mtcars data"),
               plotlyOutput("test_plot"),
               linebreaks(2),
               h2("An example data table using mtcars data"),
               DT::dataTableOutput("test_data_table"),
               linebreaks(2)
               
      ) # tabpanel
    ) # navbar
  ) # taglist
) # ui fluidpage

### END SCRIPT