
####################### Boards Page - SERVER #######################

# Filtering data for seen_box
seen_box <- reactive({
  Seen %>%
    filter(`NHS Board` == input$board) %>%
    filter(Specialty == input$specialty) %>%
    filter(`Month/Year` == input$month) %>%
    filter(Indicator == "0 - 4 weeks (%)") 
})

# Passing data to seen valueBox
output$seen_performance <- renderText({
  prettyNum(input$seen_box, big.mark=",")
})

# Filtering data for waiting_box
waiting_box <- reactive({
  Waiting %>%
    filter(`NHS Board` == input$board) %>%
    filter(Specialty == input$specialty) %>%
    filter(`Month/Year` == input$month) %>%
    filter(Indicator == "0 - 4 weeks (%)") %>%
    select(Value, -Qualifier)
})

# Passing data to waiting ValueBox
output$waiting_performance <- renderText({
  prettyNum(input$waiting_box, big.mark=",")
})

# Create filtered_data to use in chart
filtered_data <- reactive({
  Join_all_long2 %>%
    filter(`NHS Board` == input$board) %>%
    filter(Specialty == input$specialty)
})

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
    scale_x_date(date_labels = "%b %y", breaks = as.Date(c("2020-01-01", "2020-04-01",
                                                           "2020-07-01", "2020-10-01",
                                                           "2021-01-01", "2021-04-01",
                                                           "2021-07-01", "2021-10-01",
                                                           "2022-01-01", "2022-04-01",
                                                           "2022-07-01", "2022-10-01",
                                                           "2023-01-01", "2023-04-01")))+
    scale_color_manual(values=c('#2F5597','#5B9BD5','#00B0F0','#1F4E79')) +
    ylab(NULL) +
    xlab(NULL) +
    theme(plot.title.position = "panel") +
    scale_y_continuous (labels=function(x) format(x, big.mark = ",", scientific = FALSE))
    
    ggplotly(board_plot, 
             tooltip = "text") %>%
    layout(legend = list(orientation = 'h', x = 0.1, y = -0.2)) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove )
})


