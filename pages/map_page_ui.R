tagList(
  
  
  fluidRow(
    h1("View data by Health and Social Care Partnership")
    
  ), 
  
  fluidRow(
    column(4,
           selectInput("board_map",
                       "Select a Board",
                       choices = c("NHS Ayrshire & Arran",
                                   "NHS Borders",
                                   "NHS Dumfries & Galloway",
                                   "NHS Fife",
                                   "NHS Forth Valley",
                                   "NHS Grampian",
                                   "NHS Greater Glasgow & Clyde",
                                   "NHS Highland",
                                   "NHS Lanarkshire",
                                   "NHS Lothian",
                                   "NHS Orkney",
                                   "NHS Shetland",
                                   "NHS Tayside",
                                   "NHS Western Isles"
                       )
           )
    ),
    column(4,
           selectInput("specialty_map",
                       "Select a Specialty",
                       choices = unique(hscp_map_data$Specialty)
           )
    ),
    column(4, 
           selectInput("quarter_map",
                       "Select a quarter and year",
                       choices = unique(hscp_map_data$`Quarter/Year`)
                       
           )
           
    )
    
  ),
  
  fluidRow(
    
   leafletOutput("HSCP_map") 
    
  ), 
)



