
####################### Boards Page - SERVER #######################

# Filtering data for seen_box - need the pull to pick up the instance of Value
seen_box <- reactive({
  Seen %>%
    filter(`NHS Board` == input$board) %>%
    filter(Specialty == input$specialty) %>%
    filter(`Month/Year` == input$month) %>%
    filter(Indicator == "0 - 4 weeks (%)") %>%
    pull(Value)
})

# Passing data to seen valueBox. Need seen_box() instead of input$seen_box 
output$seen_performance <- renderText({
  as.character(div(style = "font-size: 125%; color: white !important;",paste0(seen_box(),"%"))) 
})



# Create filtered_data to use in chart
filtered_data <- reactive({
  Join_all_long2 %>%
    filter(`NHS Board` == input$board) %>%
    filter(Specialty == input$specialty)
})

output$valuebox_text <- renderUI({
  
  list(
    
    h3("Performance against the target for ",input$board, "for", input$specialty, "during", input$month)
    
  )
})


dq_filtered <- reactive({
  dq %>% dplyr::filter(board == input$board)
})

output$dq_text <- renderUI({
  
  list(
    
    h3("Trend chart for ",input$board),    
    
    if(input$board == "Scotland") {
      p("View data quality notes for each board on the Notes tab.")
    } else {
      purrr::map(dq_filtered()$text, p)
    }
    
  )
  
})

legend_title <- ""

# waiting-list_chart
output$waiting_list_chart <- renderPlotly({
  board_plot <-
    ggplot(data = filtered_data(),
         aes(x = `Month/Year`, y = Value, group = Indicator,
             text = paste0("Date: ", format(`Month/Year`, "%B %Y"), "<br>",
                           Indicator, ": ", format(Value, big.mark = ",", scientific = FALSE))
             )
           ) +
    geom_line(aes(colour= Indicator), size=1.2) +
    theme_bw() +
    theme(legend.text = element_text(size = 12)) +
    theme(legend.position="bottom") +
    theme(legend.title=element_blank()) +
    theme(axis.text=element_text(size=12),axis.title=element_text(size=12)) +
    scale_x_date(date_labels = "%b %y", breaks = as.Date(c(
                                                           "2020-01-31", "2020-04-30",
                                                           "2020-07-31", "2020-10-31",
                                                           "2021-01-31", "2021-04-30",
                                                           "2021-07-31", "2021-10-31",
                                                           "2022-01-31", "2022-04-30",
                                                           "2022-07-31", "2022-10-31",
                                                           "2023-01-31", "2023-04-30")))+
#    scale_color_manual(values=c('#2F5597','#5B9BD5','#00B0F0','#1F4E79')) +
    scale_color_manual(legend_title,values=rev(as.character(phsstyles::phs_palettes$`main`))) +
#    scale_fill_manual(values=rev(as.character(phsstyles::phs_palettes$`main-blues`))) +
    ylab(NULL) +
    xlab(NULL) +
    theme(plot.title.position = "panel") +
    scale_y_continuous (labels=function(x) format(x, big.mark = ",", scientific = FALSE))
    
    ggplotly(board_plot, 
             tooltip = "text") %>%
      layout(legend = list(orientation = 'h', x = 0.1, y = 1.2)) %>%
      #    layout(legend = list(orientation = 'h', x = 0.1, y = -0.2)) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove ) 
})

