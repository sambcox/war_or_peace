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

  it "can identify high ranking cards" do
    card1 = Card.new(:heart, '3', 3)
    card2 = Card.new(:diamond, 'Queen', 12)
    card3 = Card.new(:spade, '5', 5)

    deck = Deck.new([card1, card2, card3])

    expect(deck.high_ranking_cards).to eq([card2])
  end

  it "can calculate percentage of high ranking cards" do
    card1 = Card.new(:heart, '3', 3)
    card2 = Card.new(:diamond, 'Queen', 12)
    card3 = Card.new(:spade, '5', 5)

    deck = Deck.new([card1, card2, card3])

    expect(deck.percent_high_ranking).to eq(33.33)
  end

  it "can remove the top card from the deck" do
    card1 = Card.new(:heart, '3', 3)
    card2 = Card.new(:diamond, 'Queen', 12)
    card3 = Card.new(:spade, '5', 5)

    deck = Deck.new([card1, card2, card3])

    removed_card = deck.remove_card

    expect(removed_card).to eq(card1)
    expect(deck.cards).to eq([card2, card3])
  end

  it "can add a card to the bottom of the deck" do
    card1 = Card.new(:heart, '3', 3)
    card2 = Card.new(:diamond, 'Queen', 12)
    card3 = Card.new(:spade, '5', 5)
    card4 = Card.new(:club, 'Ace', 14)

    deck = Deck.new([card1, card2, card3])

    deck.add_card(card4)

    expect(deck.cards).to eq([card1, card2, card3, card4])
  end
end
