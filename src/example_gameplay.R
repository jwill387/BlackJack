source("src/black_jack.R")

# Set up new deck and empty hands for player and dealer
GAME_STATE <- initialize_game()

# Play user turn
# Just stand in, needs to be shiny-ified
while (calc_hand_total(GAME_STATE$player) <= 21) {
  print(GAME_STATE$player)
  response <- readline("\nHit (H) or Stay (S)?: ")

  if (response == "H") {
    GAME_STATE <- deal_card(GAME_STATE, "player")
  } else if (response == "S") {
    break
  }
}

# Dealer hits until hand total >= 17
GAME_STATE <- play_dealer_turn(GAME_STATE)

# Assign outcomes for player bust, player win, dealer win, & push
GAME_STATE <- assign_game_outcome(GAME_STATE)

# Show results
GAME_STATE$dealer
calc_hand_total(GAME_STATE$dealer)

GAME_STATE$player
calc_hand_total(GAME_STATE$player)

GAME_STATE$outcome
