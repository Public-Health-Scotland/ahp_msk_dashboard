####################### Download Page #######################

tagList(
  
  
  fluidRow(
           h1("Select the data you wish to download."),
  
  p("This section allows you to view the data in table format.                        
		  You can use the filters to select the data you are interested in.                        
		  You can also download the data as a csv using the download button."),                                            
    

), #fluidrow

  fluidRow(
  column(6,
         selectInput("board",
                     "Select a Board",
                     #choices = unique(Join_all_long2$`NHS Board`)
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
  
)
  
  

#  DT::dataTableOutput(“table_output”)
  
# ui <- fluidPage(
#   
#   radioButtons(“gender”,
#                 “Male or Female Dogs?”,
#                 choices = c(“Male”, “Female”)),
#   
#   DT::dataTableOutput(“table_output”)
# )
)