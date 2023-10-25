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
         selectInput("dataset",
                     "Select a dataset",
                      choices = data_list_data_tab
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