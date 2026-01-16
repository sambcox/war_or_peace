require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do

  let (:card1) { Card.new(:heart, '3', 3) }
  let (:card2) { Card.new(:diamond, 'Queen', 12) }
  let (:card3) { Card.new(:spade, '5', 5) }
  let (:card4) { Card.new(:club, '3', 3) }
  let (:card5) { Card.new(:spade, 'Queen', 12) }
  let (:card6) { Card.new(:diamond, '5', 5) }

  it "exists and has readable attributes" do
    deck1 = Deck.new([card1, card2, card5])
    deck2 = Deck.new([card3, card4, card6])
    player1 = Player.new("Clarisa", deck1)
    player2 = Player.new("Jordan", deck2)
    turn = Turn.new(player1, player2)

    expect(turn).to be_a(Turn)
    expect(turn.player1).to eq(player1)
    expect(turn.player2).to eq(player2)
  end

  it "can start with no spoils of war" do
    deck1 = Deck.new([card1, card2, card5])
    deck2 = Deck.new([card3, card4, card6])
    player1 = Player.new("Clarisa", deck1)
    player2 = Player.new("Jordan", deck2)
    turn = Turn.new(player1, player2)

    expect(turn.spoils_of_war).to eq([])
  end

  it "can return turn type correctly when basic" do
    deck1 = Deck.new([card1, card2, card5])
    deck2 = Deck.new([card3, card4, card6])
    player1 = Player.new("Clarisa", deck1)
    player2 = Player.new("Jordan", deck2)
    turn = Turn.new(player1, player2)

    expect(turn.type).to eq(:basic)
  end

  it "can return turn type correctly when war" do
    deck1 = Deck.new([card1, card2, card5])
    deck2 = Deck.new([card4, card3, card6])
    player1 = Player.new("Clarisa", deck1)
    player2 = Player.new("Jordan", deck2)
    turn = Turn.new(player1, player2)

    expect(turn.type).to eq(:war)
  end

  it "can return turn type correctly when mutually assured destruction" do
    deck1 = Deck.new([card1, card2, card3])
    deck2 = Deck.new([card4, card5, card6])
    player1 = Player.new("Clarisa", deck1)
    player2 = Player.new("Jordan", deck2)
    turn = Turn.new(player1, player2)

    expect(turn.type).to eq(:mutually_assured_destruction)
  end

  it "can determine the winner of a basic turn" do
    deck1 = Deck.new([card1, card2, card5])
    deck2 = Deck.new([card3, card4, card6])
    player1 = Player.new("Clarisa", deck1)
    player2 = Player.new("Jordan", deck2)
    turn = Turn.new(player1, player2)

    expect(turn.winner).to eq(player2)
  end

  it "can determine the winner of a war turn" do
    deck1 = Deck.new([card1, card2, card5])
    deck2 = Deck.new([card4, card3, card6])
    player1 = Player.new("Clarisa", deck1)
    player2 = Player.new("Jordan", deck2)
    turn = Turn.new(player1, player2)

    expect(turn.winner).to eq(player1)
  end

  it "returns no winner for winner in mutually assured destruction turn" do
    deck1 = Deck.new([card1, card2, card3])
    deck2 = Deck.new([card4, card5, card6])
    player1 = Player.new("Clarisa", deck1)
    player2 = Player.new("Jordan", deck2)
    turn = Turn.new(player1, player2)

    expect(turn.winner).to eq("No Winner")
  end
end