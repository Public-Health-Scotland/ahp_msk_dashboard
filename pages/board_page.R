####################### Boards Page #######################

output$board_page_ui <-  renderUI({

  div(
    
#       fluidRow(
#         column(6,
#                selectInput("board",
#                            "Select a Board",
#                            choices = unique(Join_all_long$board))
#      )
#       ),
    
	     fluidRow(
           plotOutput("waiting_list_chart") 
           
	      ) #fluidrow
   ) # div
}) # renderUI
