####################### Specialty Page #######################


tagList(
  
  
  fluidRow(
    h1("View data by NHS Board and Specialty"),
    
  ), 
  
  fluidRow(
    column(6,
           selectizeInput("board_specialty",
                       "Select a Board (Up to 4 selections)",
                       choices = c("Scotland",
                                   "NHS Ayrshire & Arran",
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
                       ),
                       multiple = TRUE,
                       selected = "Scotland",
                       options = list(maxItems = 4L)
                       
           )
    ),
    column(6,
           selectInput("specialty_specialty",
                       "Select a Specialty",
                       choices = unique(Join_all_long2$Specialty)
           )
    )
           
    ),
  
  fluidRow(
    column(6,
           h2("Referrals: Select an indicator"),
           selectInput("refs_indicator",
                       "Select an Indicator",
                       choices = unique(Referrals$Indicator),
                       selected = "Number of referrals"
           ),
           plotlyOutput("referrals_specialty_plot")
           ),
    column(6,
           h2("Removals: Select an indicator"),
           selectInput("removals_indicator",
                       "Select an Indicator",
                       choices = unique(Removals$Indicator),
                       selected = "Removals from list",
           ),
           plotlyOutput("removals_specialty_plot")
    )
  ),
  
  fluidRow(
    column(6,
           h2("Seen: Select an indicator"),
           selectInput("seen_indicator",
                       "Select an Indicator",
                       choices = unique(Seen$Indicator),
                       selected = "Patients seen"
           ),
           plotlyOutput("seen_specialty_plot")
    ),
    column(6,
           h2("Waiting: Select an indicator"),
           selectInput("waiting_indicator",
                       "Select an Indicator",
                       choices = unique(Waiting$Indicator),
                       selected = "Patients waiting"
           ),
           plotlyOutput("waiting_specialty_plot")
    )
  )
  
  
    
  ) #TagList



