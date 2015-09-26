# server.R

sample.size <- function(population, c.lev = 95, c.int = 5, distribution = 50) {
  z = qnorm(0.5 + c.lev/200)
  ss = (z^2 * (distribution/100) * (1 - (distribution/100)))/((c.int/100)^2)
  samp.size = ss/(1 + ((ss - 1)/population))
  
  setNames(
    stack(
      data.frame(Population = population, 
                 "Confidence Level" = c.lev, 
                 "Confidence Interval" = c.int, 
                 "Response Distribution" = distribution, 
                 "Required Sample Size" = round(samp.size, digits = 0),
                 check.names = FALSE))[c(2, 1)],
    c("Parameters", "Values"))
}

library(shiny)

shinyServer(function(input, output) {

  output$Preface <- renderText({
    paste("The desired sample size for a population of", 
          input$population, "with a confidence level of",
          input$confidenceLevel, "and a confidence interval of",
          input$confidenceInterval, "and a response distribution of",
          input$distribution, "is: ", collapse = " ")
  })
  
  output$Sample <- renderTable({
    input$goButton
    data <- sample.size(population = isolate(input$population),
                        c.lev = input$confidenceLevel,
                        c.int = input$confidenceInterval,
                        distribution = input$distribution)
  })
})