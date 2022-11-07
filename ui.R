library(shiny)
library(shinyWidgets)

fluidPage(
  titlePanel("Blackjack"),
  actionBttn(
    inputId = "deal",
    label = "Deal",
    style = "pill",
    color = "success"
  ),
  verbatimTextOutput("TEST")
)
