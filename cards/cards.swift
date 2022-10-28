// We worked on this together 
struct PlayingCard: CustomStringConvertible, Hashable {
  let suit: String
  let value: Int
  var description: String {
    get {
      return "\(value) of \(suit)"
    }
  } 
}

struct DeckOfPlayingCards {
  var count: Int {
      get {
          return deck.count
      }
  }
  var deck: Set<PlayingCard> = []
  init() {
    for suit in ["hearts", "spades", "diamonds", "clubs"] {
      for val in 1...13 {
        deck.insert(PlayingCard(suit: suit, value: val))
      }
    }
  }

  mutating func drawCard() -> PlayingCard {
    let card = deck.randomElement()!

    return deck.remove(card)!
  }

  mutating func dealHands(numPlayers: Int, numCards: Int) -> [[PlayingCard]] {
    var hands: [[PlayingCard]] = []
    if numPlayers*numCards > deck.count {
      return [[]]
    } else {
      for _ in 0..<numPlayers {
        var hand: [PlayingCard] = []
        for _ in 0..<numCards {
          hand.append(drawCard())
        }
        hands.append(hand)
      }
    }
    return hands
  }

  mutating func shuffle() {}

  mutating func collectAllCards() {
    deck = []
    for suit in ["hearts", "spades", "diamonds", "clubs"] {
      for val in 1...13 {
        deck.insert(PlayingCard(suit: suit, value: val))
      }
    }
  }
}
