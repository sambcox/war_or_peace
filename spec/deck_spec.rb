require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do
  it "exists" do
    deck = Deck.new([])

    expect(deck).to be_an_instance_of(Deck)
  end

  it "has individual cards" do
    card1 = Card.new(:heart, '3', 3)
    card2 = Card.new(:diamond, 'Queen', 12)
    card3 = Card.new(:spade, '5', 5)

    deck = Deck.new([card1, card2, card3])

    expect(deck.cards).to eq([card1, card2, card3])
  end

  it "can rank cards at specific indices" do
    card1 = Card.new(:heart, '3', 3)
    card2 = Card.new(:diamond, 'Queen', 12)
    card3 = Card.new(:spade, '5', 5)

    deck = Deck.new([card1, card2, card3])

    expect(deck.rank_of_card_at(0)).to eq(3)
    expect(deck.rank_of_card_at(1)).to eq(12)
    expect(deck.rank_of_card_at(2)).to eq(5)
  end
end
