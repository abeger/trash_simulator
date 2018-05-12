# frozen_string_literal: true

# A player's tableau of 10 cards
class Tableau
  def initialize
    @cards = []
  end

  # TODO: should probably throw if more than 10 cards added
  def add_card(rank)
    @cards << Card.new(rank)
  end

  def first_facedown
    @cards.find_index(&:facedown?) + 1
  end

  def play_card(pos, rank = pos)
    return pos if pos == Deck::TRASH
    loc = @cards[pos - 1]
    # TODO: throw?
    return Deck::TRASH unless loc.facedown? || loc.rank == 'K'
    popped_rank = loc.rank
    @cards[pos - 1] = Card.new(rank, false)
    popped_rank
  end

  def to_s
    print_range(0..4) + "\n" + print_range(5..9)
  end

  def print_range(range)
    @cards[range].map(&:print).join(' ')
  end

  def complete?
    @cards.none?(&:facedown?)
  end
end
