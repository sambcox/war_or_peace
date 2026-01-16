require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'

RSpec.describe Player do
  it "exists and has a deck of cards" do
    card1 = Card.new(:heart, '3', 3)
    card2 = Card.new(:diamond, 'Queen', 12)
    card3 = Card.new(:spade, '5', 5)

    deck = Deck.new([card1, card2, card3])
    player = Player.new("Clarisa", deck)

    expect(player).to be_an_instance_of(Player)
    expect(player.name).to eq("Clarisa")
    expect(player.deck).to eq(deck)
    expect(player.deck.cards).to eq([card1, card2, card3])
  end
end