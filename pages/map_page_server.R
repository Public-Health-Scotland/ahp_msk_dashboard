
####################### Map Page - SERVER #######################

# Need to put the shape file first when joining so that you get a shape file
hscp_map_data <-  left_join(hscp_map_data, lookup_board_hscp,
                          by = c('HIAName' = 'hscp2019name'))




# Create filtered_data to use in map
map_filtered_data <- reactive({
  hscp_map_data %>%
    filter(`hb2019name` == input$board_map) %>%
    filter(Specialty == input$specialty_map) %>%
    filter(`Quarter/Year` == input$quarter_map)
})

# Selecting and rename columns of interest 
map_dataSHP <- map_dataSHP %>% 
  select(HIAName, geometry)

# 7 - Joining files ----

# Join SHP file to data file containing patients seen and performance data 
# Need to put the shape file first when joining so that you get a shape file
map_hscp_dataSHP <-  reactive({right_join(map_dataSHP, map_filtered_data(),
                                by = c('HIAName' = 'HIAName'),
                                multiple = "all",copy = TRUE)})

output$HSCP_map <- renderLeaflet({
  # plot map
  leaflet() %>% 
    ## Plot the shape of the area on the map #### 
  # https://rstudio.github.io/leaflet/map_widget.html
  addPolygons(data = map_hscp_dataSHP(), 
              # colour of the entire polygon
              color = "blue",
              # Thickness of borders
              weight = 1, 
              # adds a popup when the polygon is clicked on
              popup = ~paste0("Health Board: ", hb2019name, "<br>",
                              "HSCP Name: ", HIAName, "<br>",
                              "Specialty: ", Specialty, "<br>",
                              "Quarter/Year: ", `Quarter/Year`, "<br>",
                              "Patients Seen: ", prettyNum(`Patients seen`, big.mark=","), "<br>",
                              #"Patients Seen: ", `Patients seen`, "<br>",
                              "4 Week Performance: ", `0 - 4 weeks (%)`, "%"),
              # detail level of polygon (higher number = less accurate representation & better performance)
              smoothFactor = 1) %>% 
    
    # Setting map prvider for map background
    # you can see the list by typing providers$ or visiting the following link
    # # http://leaflet-extras.github.io/leaflet-providers/preview/index.html
    addProviderTiles(provider = providers$OpenStreetMap.Mapnik)
  
})

