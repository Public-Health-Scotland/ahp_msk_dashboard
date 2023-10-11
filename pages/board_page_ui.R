####################### Boards Page #######################

      

     	     fluidRow(
     	       h1("View data by NHS Board"),
     	       
     	       p("The chart below shows a trend for the number of patients waiting at the end of each 
                month , as well as the number of patients that were referred (added to the waiting list) and removed from waiting lists during 
                each month. The number removed includes those that were seen and those removed 
                for other reasons, for example because treatment was no longer required or because 
                the referral was inappropriate.  "),
     	       
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
     	       ),
     	     
     	       
             plotOutput("waiting_list_chart") 
           
	      ) #fluidrow

