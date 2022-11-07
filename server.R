library(shiny)

function(input, output) {
  GAMESTATE <- eventReactive(input$deal, {
    initialize_game()
  })

  output$TEST <- renderPrint({
    GAMESTATE()
  })
}
