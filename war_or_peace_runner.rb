require_relative 'lib/card'
require_relative 'lib/deck'

class Runner
  def self.create_deck
    suits = [:heart, :diamond, :spade, :club]
    values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
    ranks = (2..14).to_a

    cards = []

    suits.each do |suit|
      values.each_with_index do |value, index|
        cards << Card.new(suit, value, ranks[index])
      end
    end

    require pry; binding.pry
    Deck.new(cards)
  end
end

Runner.create_deck