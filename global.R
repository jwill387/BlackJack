# Deck of cards
values <- c(2:10, "J", "Q", "K", "A")
suits <- c("D", "H", "C", "S")

deck_df <- expand.grid(values, suits)
deck <- apply(deck_df, 1, function(row) {
  paste(row, collapse = "")
})
