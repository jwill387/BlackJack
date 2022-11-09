library(shiny)

function(input, output) {
  rv <- reactiveValues()

  observeEvent(input$deal, {
    rv$GAMESTATE <- initialize_game()
    rv$outcome <- NULL
  })

  observeEvent(input$hit, {
    rv$GAMESTATE <- deal_card(rv$GAMESTATE, "player")
    if (calc_hand_total(rv$GAMESTATE$player) > 21) {rv$outcome <- "Lose, Bust"}
  })

  output$TEST <- renderPrint({
    rv$GAMESTATE
  })
}

