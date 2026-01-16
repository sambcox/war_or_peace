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
end
