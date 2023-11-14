####################### Boards Page #######################


tagList(
  
  
  fluidRow(
    h1("View data by NHS Board")
    
  ), 
  
  fluidRow(
    column(4,
           selectInput("board",
                       "Select a Board",
                       choices = c("Scotland",
                                   "Ayrshire & Arran",
                                   "Borders",
                                   "Dumfries & Galloway",
                                   "Fife",
                                   "Forth Valley",
                                   "Grampian",
                                   "Greater Glasgow & Clyde",
                                   "Highland",
                                   "Lanarkshire",
                                   "Lothian",
                                   "Orkney",
                                   "Shetland",
                                   "Tayside",
                                   "Western Isles"
                       )
           )
    ),
    column(4,
           selectInput("specialty",
                       "Select a Specialty",
                       choices = unique(Join_all_long2$Specialty)
           )
    ),
    column(4, 
           selectInput("month",
                       "Select a month and year",
                       choices = unique(Seen$`Month/Year`)
                       
           )
           
    )
    
  ),
  
  fluidRow(
    
    uiOutput("valuebox_text"),
    
  ),
  
  fluidRow(
    column(6,
           valueBox(
             value = tags$p("90%", style = "font-size: 125%;"),
             subtitle = tags$p("TARGET: patients seen within 4 weeks of referral",style = "font-size: 125%;"),
             icon = icon("bullseye"), color = "fuchsia"
           )
    ),
    column(6,
           valueBox(
             value = uiOutput("seen_performance"),
             subtitle = tags$p("Patients seen within 4 weeks of referral",style = "font-size: 125%;"),
             icon = icon("hospital-user"), color = "purple"
           )
    )
  ),
  
  
  
  fluidRow(
    
    # Create the DQ automated text
    uiOutput("dq_text"),
    
    p("The chart below shows a trend for the number of patients waiting at the end of each 
                month, as well as the number of patients that were referred (added to the waiting list) and removed from waiting lists during 
                each month. The number removed includes those that were seen and those removed 
                for other reasons, for example because treatment was no longer required or because 
                the referral was inappropriate.  "),
    p(em("A single click on the legend line will remove it from the plot while a double click on the legend line will show just that line.")),
    
    plotlyOutput("waiting_list_chart") 
    
  ) #fluidrow
)



