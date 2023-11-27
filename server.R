server <- function(input, output, session) {
 
  # This chunk stops the app from timing out 
  auto_invalidate <- reactiveTimer(10000)
  observe({
    auto_invalidate()
    cat(".")
  })
  
  # Get functions
  source(file.path("functions/core_functions.R"), local = TRUE)$value
  source(file.path("functions/intro_page_functions.R"), local = TRUE)$value

  
  # Get content for individual pages
  source(file.path("pages/intro_page.R"), local = TRUE)$value
  source(file.path("pages/notes_page.R"), local = TRUE)$value
  
  # Get SERVER code for the individual pages
  
  source(file.path("pages/board_page_server.R"), local = TRUE)$value
  source(file.path("pages/download_page_server.R"), local = TRUE)$value
  source(file.path("pages/map_page_server.R"), local = TRUE)$value
  source(file.path("pages/specialty_page_server.R"), local = TRUE)$value
  
}


#### End of Script 
  
  
  
  
 

