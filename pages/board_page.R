####################### Boards Page #######################

output$board_page_ui <-  renderUI({

  div(
    

    
    p("The chart below shows a trend for the number of patients waiting at the end of each 
month , as well as the number of patients that were referred (added to the waiting list) and removed from waiting lists during 
each month. The number removed includes those that were seen and those removed 
for other reasons, for example because treatment was no longer required or because 
the referral was inappropriate.  "), 

       fluidRow(
        column(6,
               selectInput("board",
                           "Select a Board",
                           choices = unique(Join_all_long2$`NHS Board`))
     )
      ,
        column(6,
        selectInput("specialty",
                   "Select a Specialty",
                   choices = unique(Join_all_long2$Specialty))
    )
      ),

    
    	     fluidRow(
           plotOutput("waiting_list_chart") 
           
	      ) #fluidrow
   ) # div
}) # renderUI
