require_relative 'lib/card'
require_relative 'lib/deck'
require_relative 'lib/player'
require_relative 'lib/turn'

class Runner
  @@deck1 = nil
  @@deck2 = nil
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

    @@deck1 = Deck.new(cards.shuffle.shift(26))
    @@deck2 = Deck.new(cards.pop(26))
  end

  def self.start
    Runner.create_deck
    print "Welcome to War! (or Peace) This game will be played with 52 cards.\n"
    print "Please type Player 1's name:\n"
    player1_name = gets.chomp
    print "Please type Player 2's name:\n"
    player2_name = gets.chomp
    player1 = Player.new(player1_name, @@deck1)
    player2 = Player.new(player2_name, @@deck2)
    print "The players today are #{player1.name} and #{player2.name}.\n"
    print "Type 'GO' to start the game!\n"
    command = gets.chomp
    if command.downcase == "go"
      round = 0
      winner_name = ""
      turn = Turn.new(player1, player2)
      while round < 100000
        round += 1
        if player1.has_lost? || player2.has_lost?
          print "*~*~*~* #{winner_name} has won the game! *~*~*~*\n"
          break
        else
          turn_type = turn.type
          winner = turn.winner
          winner_name = winner.is_a?(String) ? winner : winner.name
          turn.pile_cards
          turn.award_spoils(winner)
          if turn_type == :basic
            print "Turn #{round}: #{winner_name} won 2 cards\n"
          elsif turn_type == :war
            print "Turn #{round}: WAR - #{winner_name} won 6 cards\n"
          else
            print "Turn #{round}: *mutually assured destruction* 6 cards removed from play\n"
          end
        end
      end
      if round == 100000
        print "---- DRAW ----\n"
      end
    else
      print "Game exited. Goodbye!\n"
      return
    end
  end
end

Runner.start
