make_new_deck <- function() {
  face_cards <- c("J", "Q", "K")
  values <- c(2:10, face_cards, "A")
  suits <- c("D", "H", "C", "S")

  deck_df <- expand.grid(values, suits, stringsAsFactors = FALSE)
  names(deck_df) <- c("card", "suit")

  deck_df$score <- deck_df$card
  deck_df$score <- ifelse(deck_df$card %in% face_cards, 10, deck_df$score)
  deck_df$score <- ifelse(deck_df$card == "A", 11, deck_df$score)
  deck_df$score <- as.numeric(deck_df$score)

  deck_df
}

make_empty_hand <- function() {
  data.frame(
    card = character(0),
    suit = character(0),
    score = character(0)
  )
}

initialize_game <- function() {
  game_state <- list(
    deck = make_new_deck(),
    dealer = make_empty_hand(),
    player = make_empty_hand(),
    outcome = NA_character_
  )

  game_state <- deal_card(game_state, "player")
  game_state <- deal_card(game_state, "dealer")
  game_state <- deal_card(game_state, "player")
  game_state <- deal_card(game_state, "dealer")

  game_state
}

calc_hand_total <- function(hand_df) {
  hand_total <- sum(hand_df$score)

  # Convert Aces from 11 to 1 if over 21
  if (hand_total > 21 & "A" %in% hand_df$card) {
    scores <- hand_df$score
    scores[hand_df$card == "A"] <- 1
    hand_total <- sum(hand_df$score)
  }

  hand_total
}

deal_card <- function(game_state, hand_name = "player") {
  i <- sample(seq_len(nrow(game_state$deck)), size = 1)

  game_state[[hand_name]]
  game_state[[hand_name]] <- rbind(game_state[[hand_name]], game_state$deck[i, ])
  game_state$deck <- game_state$deck[-i, ]

  game_state
}

play_dealer_turn <- function(game_state) {
  while (calc_hand_total(game_state$dealer) < 17) {
    game_state <- deal_card(game_state, "dealer")
  }

  game_state
}

assign_game_outcome <- function(game_state) {
  outcomes <- list(
    player_wins = "Player wins!!",
    dealer_wins = "Dealer wins :(",
    tie = "Push...",
    bust = "Bust :("
  )

  player_score <- calc_hand_total(game_state$player)
  dealer_score <- calc_hand_total(game_state$dealer)

  if (player_score > 21) {
    game_state$outcome <- outcomes$bust
  } else if (player_score < dealer_score & dealer_score <= 21) {
    game_state$outcome <- outcomes$dealer_wins
  } else if (player_score == dealer_score) {
    game_state$outcome <- outcomes$tie
  }

  game_state
}
