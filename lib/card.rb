# frozen_string_literal: true

# Card represent a card in a Tableau
class Card
  attr_reader :rank

  def initialize(rank, facedown = true)
    @rank = rank
    @facedown = facedown
  end

  def facedown?
    @facedown
  end

  def flip
    @facedown = false
  end

  def print
    facedown? ? 'X' : rank
  end
end
