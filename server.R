#
# This is the server logic of a Shiny web application. 
#



library(shiny)

# Define server logic required to calculate sample size
server <- function(input, output) {
  
  observeEvent(input$calculate, {
    # Convert confidence level to decimal
    conf_level <- input$conf_level / 100
    
    # Calculate z-score based on the desired confidence level
    z_score <- qnorm((1 + conf_level) / 2)
    
    # Calculate sample size formula: n = (z^2 * p * (1-p)) / (E^2)
    sample_size <- ((z_score^2) * input$p * (1 - input$p)) / ((input$margin / 100)^2)
    
    # Print the result
    output$sample_size_output <- renderPrint({
      paste("Required Sample Size:", round(sample_size))
    })
  })
}
