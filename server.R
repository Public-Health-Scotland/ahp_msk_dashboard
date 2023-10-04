server <- function(input, output, session) {
  
  # Get functions
  source(file.path("functions/core_functions.R"), local = TRUE)$value
  source(file.path("functions/intro_page_functions.R"), local = TRUE)$value
  source(file.path("functions/page_1_functions.R"), local = TRUE)$value
  
  # Get content for individual pages
  source(file.path("pages/intro_page.R"), local = TRUE)$value
  source(file.path("pages/page_1.R"), local = TRUE)$value
  source(file.path("pages/notes_page.R"), local = TRUE)$value
  source(file.path("pages/board_page.R"), local = TRUE)$value
  
  #waiting-list_chart
  output$waiting_list_chart <- renderPlot({
    ggplot(data = Join_all_long, 
                       aes(x = `Month/Year`, y = Value, group = Indicator)) +
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
                                                             "2023-01-01")))+
      scale_color_manual(values=c('#2F5597','#5B9BD5','#00B0F0','#1F4E79')) +
      ylab(NULL) +
      xlab(NULL) +
      theme(plot.title.position = "panel") +
      scale_y_continuous (breaks=seq (0,80000,by=10000),
                          labels=function(x) format(x, big.mark = ",", scientific = FALSE))
  })
}


