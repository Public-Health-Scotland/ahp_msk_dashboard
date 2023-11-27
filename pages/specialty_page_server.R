
####################### Specialty Page - SERVER #######################

# Create filtered_data to use in Referrals Chart
refs_data_filtered <- reactive({
  Referrals %>%
    subset(`NHS Board` %in% input$board_specialty) %>%
    filter(Specialty == input$specialty_specialty) %>%
    filter(Indicator == input$refs_indicator) %>%
    filter(`Month/Year`> "2019-12-31")
})

# Create filtered_data to use in Removals Chart
removals_data_filtered <- reactive({
  Removals %>%
    subset(`NHS Board` %in% input$board_specialty) %>%
    filter(Specialty == input$specialty_specialty) %>%
    filter(Indicator == input$removals_indicator) %>%
    filter(`Month/Year`> "2019-12-31")
})

# Create filtered_data to use in Seen Chart
seen_data_filtered <- reactive({
  Seen %>%
    subset(`NHS Board` %in% input$board_specialty) %>%
    filter(Specialty == input$specialty_specialty) %>%
    filter(Indicator == input$seen_indicator) %>%
    filter(`Month/Year`> "2019-12-31")
})

# Create filtered_data to use in Waiting Chart
waiting_data_filtered <- reactive({
  Waiting %>%
    subset(`NHS Board` %in% input$board_specialty) %>%
    filter(Specialty == input$specialty_specialty) %>%
    filter(Indicator == input$waiting_indicator) %>%
    filter(`Month end`> "2019-12-31")
})

#####  Charts

# referrals_specialty_plot
output$referrals_specialty_plot <- renderPlotly({
  refs_plot <-
    ggplot(data = refs_data_filtered(),
           aes(x = `Month/Year`, y = Value, group = `NHS Board`,
               text = paste0("Date: ", format(`Month/Year`, "%B %Y"), "<br>",
                             Indicator, ": ", format(Value, big.mark = ",", scientific = FALSE))
           )
    ) +
    geom_line(aes(colour= `NHS Board`), size=1.2) +
    theme_bw() +
    theme(legend.text = element_text(size = 12)) +
    theme(legend.position="bottom") +
    theme(legend.title=element_blank()) +
    theme(axis.text=element_text(size=12),axis.title=element_text(size=12)) +
    scale_x_date(date_labels = "%b %y", breaks = as.Date(c(
      "2020-01-31", 
      "2020-07-31", 
      "2021-01-31", 
      "2021-07-31", 
      "2022-01-31", 
      "2022-07-31", 
      "2023-01-31")))+
    scale_color_manual(values=rev(as.character(phsstyles::phs_palettes$`main`))) +
    ylab(NULL) +
    xlab(NULL) +
    labs(alt = "A line chart...") +
    theme(plot.title.position = "panel") +
    scale_y_continuous (labels=function(x) format(x, big.mark = ",", scientific = FALSE))
  
  ggplotly(refs_plot, 
           tooltip = "text") %>%
    layout(legend = list(orientation = 'h', x = 0.1, y = -0.2)) %>%
    #    layout(legend = list(orientation = 'h', x = 0.1, y = -0.2)) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove )
})

# removals_specialty_plot
output$removals_specialty_plot <- renderPlotly({
  removals_plot <-
    ggplot(data = removals_data_filtered(),
           aes(x = `Month/Year`, y = Value, group = `NHS Board`,
               text = paste0("Date: ", format(`Month/Year`, "%B %Y"), "<br>",
                             Indicator, ": ", format(Value, big.mark = ",", scientific = FALSE))
           )
    ) +
    geom_line(aes(colour= `NHS Board`), size=1.2) +
    theme_bw() +
    theme(legend.text = element_text(size = 12)) +
    theme(legend.position="bottom") +
    theme(legend.title=element_blank()) +
    theme(axis.text=element_text(size=12),axis.title=element_text(size=12)) +
    scale_x_date(date_labels = "%b %y", breaks = as.Date(c(
      "2020-01-31", 
      "2020-07-31", 
      "2021-01-31", 
      "2021-07-31", 
      "2022-01-31", 
      "2022-07-31", 
      "2023-01-31")))+
    scale_color_manual(values=rev(as.character(phsstyles::phs_palettes$`main`))) +
    ylab(NULL) +
    xlab(NULL) +
    labs(alt = "A line chart...") +
    theme(plot.title.position = "panel") +
    scale_y_continuous (labels=function(x) format(x, big.mark = ",", scientific = FALSE))
  
  ggplotly(removals_plot, 
           tooltip = "text") %>%
    layout(legend = list(orientation = 'h', x = 0.1, y = -0.2)) %>%
    #    layout(legend = list(orientation = 'h', x = 0.1, y = -0.2)) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove )
})

# seen_specialty_plot
output$seen_specialty_plot <- renderPlotly({
  seen_plot <-
    ggplot(data = seen_data_filtered(),
           aes(x = `Month/Year`, y = Value, group = `NHS Board`,
               text = paste0("Date: ", format(`Month/Year`, "%B %Y"), "<br>",
                             Indicator, ": ", format(Value, big.mark = ",", scientific = FALSE))
           )
    ) +
    geom_line(aes(colour= `NHS Board`), size=1.2) +
    theme_bw() +
    theme(legend.text = element_text(size = 12)) +
    theme(legend.position="bottom") +
    theme(legend.title=element_blank()) +
    theme(axis.text=element_text(size=12),axis.title=element_text(size=12)) +
    scale_x_date(date_labels = "%b %y", breaks = as.Date(c(
      "2020-01-31", 
      "2020-07-31", 
      "2021-01-31", 
      "2021-07-31", 
      "2022-01-31", 
      "2022-07-31", 
      "2023-01-31")))+
    scale_color_manual(values=rev(as.character(phsstyles::phs_palettes$`main`))) +
    ylab(NULL) +
    xlab(NULL) +
    labs(alt = "A line chart...") +
    theme(plot.title.position = "panel") +
    scale_y_continuous (labels=function(x) format(x, big.mark = ",", scientific = FALSE))
  
  ggplotly(seen_plot, 
           tooltip = "text") %>%
    layout(legend = list(orientation = 'h', x = 0.1, y = -0.2)) %>%
    #    layout(legend = list(orientation = 'h', x = 0.1, y = -0.2)) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove )
})

# waiting_specialty_plot
output$waiting_specialty_plot <- renderPlotly({
  waiting_plot <-
    ggplot(data = waiting_data_filtered(),
           aes(x = `Month end`, y = Value, group = `NHS Board`,
               text = paste0("Date: ", format(`Month end`, "%B %Y"), "<br>",
                             Indicator, ": ", format(Value, big.mark = ",", scientific = FALSE))
           )
    ) +
    geom_line(aes(colour= `NHS Board`), size=1.2) +
    theme_bw() +
    theme(legend.text = element_text(size = 12)) +
    theme(legend.position="bottom") +
    theme(legend.title=element_blank()) +
    theme(axis.text=element_text(size=12),axis.title=element_text(size=12)) +
    scale_x_date(date_labels = "%b %y", breaks = as.Date(c(
      "2020-01-31", 
      "2020-07-31", 
      "2021-01-31", 
      "2021-07-31", 
      "2022-01-31", 
      "2022-07-31", 
      "2023-01-31")))+
    scale_color_manual(values=rev(as.character(phsstyles::phs_palettes$`main`))) +
    ylab(NULL) +
    xlab(NULL) +
    labs(alt = "A line chart...") +
    theme(plot.title.position = "panel") +
    scale_y_continuous (labels=function(x) format(x, big.mark = ",", scientific = FALSE))
  
  ggplotly(waiting_plot, 
           tooltip = "text") %>%
    layout(legend = list(orientation = 'h', x = 0.1, y = -0.2)) %>%
    #    layout(legend = list(orientation = 'h', x = 0.1, y = -0.2)) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove )
})







