var deck = DeckOfPlayingCards()
print(deck.drawCard())
print(deck.drawCard())
print(deck.drawCard())
let hands = deck.dealHands(numPlayers: 4, numCards: 5)
for h in hands {
  print(h)
}

print(deck.count)
deck.collectAllCards()
print(deck.count)
