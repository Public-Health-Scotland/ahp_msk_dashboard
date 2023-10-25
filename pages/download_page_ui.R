####################### Download Page #######################

tagList(
  
  
  fluidRow(
           h1("Select the data you wish to download."),
  
  p("This section allows you to view the data in table format.                        
		  You can use the filters to select the data you are interested in.                        
		  You can also download the data as a csv using the download button."),                                            
    

), #fluidrow

  
#  ),
#),

  
  
fluidRow(
  column(6,
         selectInput("dataset",
                     "Select a dataset",
                     choices = data_list_data_tab),
  column(6, downloadButton(outputId = 'download_table_csv', 
                           label = 'Download data')),
  
  DT::dataTableOutput("download_table")
)


)