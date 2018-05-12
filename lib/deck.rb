# frozen_string_literal: true

# Deck of cards, no suits
class Deck
  attr_reader :deck

  TRASH = 'trash'

  def initialize
    @deck = build_deck
  end

  def shuffle
    @deck.shuffle!
  end

  # returns nil when the deck is empty
  # TODO: should this throw?
  def deal_card
    @deck.shift
  end

  private

  def build_deck
    cards = 1.upto(10).map do |rank|
      Array.new(4, rank)
    end
    cards << Array.new(4, 'K')
    cards << Array.new(8, TRASH)
    cards.flatten
  end
end
