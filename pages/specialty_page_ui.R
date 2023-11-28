####################### Specialty Page #######################


tagList(
  
  
  fluidRow(
    h1("View data by NHS Board and Specialty"),
    p("This page shows 4 charts: Referrals, Removals, Patients Seen and Patients Waiting. Data quality notes for each NHS Board can be found on the Notes tab.")
    
  ), 
  
  fluidRow(
    column(6,
           p(em("Please select up to 4 NHS Boards.")),
           selectizeInput("board_specialty",
                       "Select NHS Board(s)",
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
           p(em("Please select 1 Specialty.")),
           selectInput("specialty_specialty",
                       "Select a Specialty",
                       choices = unique(Join_all_long2$Specialty)
           )
    )
           
    ),
  
  fluidRow(
    column(6,
           h2("Referrals: Select an indicator"),
           p(em("Please select 1 Indicator.")),
           selectInput("refs_indicator",
                       "Select an Indicator",
                       choices = unique(Referrals$Indicator),
                       selected = "Number of referrals"
           ),
           plotlyOutput("referrals_specialty_plot")
           ),
    column(6,
           h2("Removals: Select an indicator"),
           p(em("Please select 1 Indicator.")),
           selectInput("removals_indicator",
                       "Select an Indicator",
                       choices = unique(Removals$Indicator),
                       selected = "Removals from list",
           ),
           plotlyOutput("removals_specialty_plot")
           )
  ),
  fluidRow(p(em("A single click on the legend line will remove it from the plot while a double click on the legend line will show just that line."))),
  fluidRow(
    column(6,
           h2("Seen: Select an indicator"),
           p(em("Please select 1 Indicator.")),
           selectInput("seen_indicator",
                       "Select an Indicator",
                       choices = unique(Seen$Indicator),
                       selected = "Patients seen"
           ),
           plotlyOutput("seen_specialty_plot")
           ),
    column(6,
           h2("Waiting: Select an indicator"),
           p(em("Please select 1 Indicator.")),
           selectInput("waiting_indicator",
                       "Select an Indicator",
                       choices = unique(Waiting$Indicator),
                       selected = "Patients waiting"
           ),
           plotlyOutput("waiting_specialty_plot")
           )
  ),
  fluidRow(p(em("A single click on the legend line will remove it from the plot while a double click on the legend line will show just that line."))),
  
  
    
  ) #TagList



