# ui.R

library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Sample Size Calculator"),
  
  sidebarPanel(
    helpText("Calculate the sample size required given a certain set of parameters."),
    numericInput("population", label = "Population Size", value = NULL,
                 min = 2, max = Inf),
    actionButton("goButton", "Calculate my sample size!"), br(), br(),
    sliderInput("confidenceLevel", label = "Confidence Level",
                min = .1, max = 100, value = 95),
    sliderInput("confidenceInterval", label = "Confidence Interval",
                min = .1, max = 100, value = 5),
    sliderInput("distribution", label = "Response Distribution",
                min = .1, max = 100, value = 50),
    helpText("NOTE: Values will change dynamically with all inputs except for the values in the Population Size field. Enter a value and click on 'Calculate my sample size!' to get updated results.")
  ),
  mainPanel(
    textOutput("Preface"),
    br(),
    tableOutput("Sample"),
    h2("Documentation"),
    p("Often, when planning to administer a survey, it is prohibitive to administer the survey to the entire study population. Instead, statistical methods are employed to determine what the desired sample size would be given a specific population size and related sampling parameters."),
    h4("How to use this app"),
    p("Start by entering the population size you are dealing with. Then, use the sliders to see how the population size changes according to different confidence intervals, confidence levels, and response distributions.")
    )
  )
)