library(shiny)
library(shinyWidgets)

shinyUI(fluidPage(
    titlePanel("Blackjack"),

    actionBttn(
      inputId = "deal",
      label = "Deal",
      style = "pill",
      color = "success"
    )
))
