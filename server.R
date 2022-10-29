library(shiny)

shinyServer(function(input, output) {
  observeEvent(input$deal, {
    userHand <- sample(deck, size = 2, replace = FALSE)

  })

})
