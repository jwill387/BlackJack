userHand <- sample(deck, size = 2, replace = FALSE)
userHand <- c('KD', '9S')

userVals <- substr(userHand, 1, nchar(userHand) - 1)
userVals <- as.factor(userVals)


if (userVals %in% c("J","Q","K")) {
  userHand[userVals %in% c("J","Q","K")] <- paste0(10, substr(userHand, nchar(userHand), nchar(userHand)))
}
