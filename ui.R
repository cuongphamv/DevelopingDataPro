#
# This is the user-interface definition of a Shiny web application. 


library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  titlePanel("Simple Random Sample Size Calculator"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("p", "Population Proportion (p):", 0.5, min = 0, max = 1, step = 0.01),
      numericInput("margin", "Margin of Error (%):", 5, min = 0, max = 100),
      numericInput("conf_level", "Confidence Level (%):", 95, min = 0, max = 100),
      br(),
      actionButton("calculate", "Calculate"),
      br()
    ),
    
    mainPanel(
      h4("Sample Size Calculation:"),
      verbatimTextOutput("sample_size_output")
    )
  )
)