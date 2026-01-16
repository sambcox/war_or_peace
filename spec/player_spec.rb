require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'

RSpec.describe Player do
  let(:cards) do
    [
      Card.new(:heart, '3', 3),
      Card.new(:diamond, 'Queen', 12),
      Card.new(:spade, '5', 5)
    ]
  end

  let(:deck) { Deck.new(cards) }
  let(:player) { Player.new("Clarisa", deck) }
  let(:empty_player) { Player.new("Jordan", Deck.new([])) }

  it "exists and has a deck of cards" do
    expect(player).to be_a(Player)
    expect(player.name).to eq("Clarisa")
    expect(player.deck).to eq(deck)
    expect(player.deck.cards).to eq(cards)
  end

  it "can determine if a player has lost" do
    expect(player.has_lost?).to eq(false)
    expect(empty_player.has_lost?).to eq(true)
  end
end
