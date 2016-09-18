class Player < ApplicationRecord
  has_many :winner, class_name: 'Match', foreign_key: 'winner_id'
  has_many :loser, class_name: 'Match', foreign_key: 'loser_id'
end
