server <- function(input, output, session) {
  
  # Get functions
  source(file.path("functions/core_functions.R"), local = TRUE)$value
  source(file.path("functions/intro_page_functions.R"), local = TRUE)$value
  source(file.path("functions/page_1_functions.R"), local = TRUE)$value
  
  # Get content for individual pages
  source(file.path("pages/intro_page.R"), local = TRUE)$value
  source(file.path("pages/page_1.R"), local = TRUE)$value
  source(file.path("pages/notes_page.R"), local = TRUE)$value
  
  # Get SERVER code for the individual pages
  
  source(file.path("pages/board_page_server.R"), local = TRUE)$value
  
}


#### End of Script 
  
  
  
  
 

