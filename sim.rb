# frozen_string_literal: true

require_relative 'lib/trash'

d = Deck.new
d.shuffle
player1 = Tableau.new
1.upto(10) do
  player1.add_card d.deal_card
end
until player1.complete?
  card = d.deal_card
  puts "Drew #{card}"
  until card == Deck::TRASH || player1.complete?
    pos = card == 'K' ? player1.first_facedown : card
    card = player1.play_card(pos, card)
    puts
    puts player1
    puts
    puts "Flipped #{card}"
  end
end

puts 'Won!'
