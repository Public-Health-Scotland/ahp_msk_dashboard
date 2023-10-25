

# CREATE THE DATA TABLE ----

data_table <- reactive({
  # Change dataset depending on what user selected
  table_data <- switch(input$dataset,
                        "Referrals" = Referrals,
                        "Patients Seen" = Seen,
                        "Patients Waiting" = Waiting,
                        "Removals" = Removals, 
                        "Join_all_long2" = Join_all_long2)
                       
                   #    "data_allergy" = data_allergy, 
                  #     "data_asthma" = data_asthma)
  
  # if (input$data_select == "data_allergy") { 
  #   table_data %<>%
  #     select(year, type, measure, value)
  # } else if (input$data_select == "data_asthma") { 
  #   table_data %<>%
  #     select(diagnosis, year, sex, age_grp, numerator, rate)
  # }
})

# RENDER THE DATA TABLE ----

output$download_table <- DT::renderDataTable({
  
  # Remove the underscore from column names in the table
  table_colnames  <-  gsub("_", " ", colnames(data_table()))
  
  DT::datatable(data_table(), 
                style = 'bootstrap',
                class = 'table-bordered table-condensed',
                rownames = FALSE,
                options = list(pageLength = 20,
                               dom = 'tip',
                               autoWidth = TRUE),
                filter = "top",
                colnames = table_colnames)
})   

# ENABLE DATA TO BE DOWNLOADED ----

# ENABLE DATA TO BE DOWNLOADED ----
output$download_table_csv <- downloadHandler(
  filename = function() {
    paste(input$dataset, ".csv", sep = "")
  },
  content = function(file) {
    # This downloads only the data the user has selected using the table filters
    write_csv(data_table()[input[["download_table_rows_all"]], ], file) 
    #    write_csv(data_table()[input[["table_filtered_rows_all"]], ], file) 
  } 
)



