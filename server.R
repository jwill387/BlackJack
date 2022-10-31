library(shiny)

shinyServer(function(input, output) {
  output$new_deal <- observeEvent(input$deal, {
    my_reactive_value <- eventReactive(input$button, {
      GAMESTATE <- initialize_game()
    })

    output$TEST <- renderPrint({
      GAMESTATE
    })
  })

})