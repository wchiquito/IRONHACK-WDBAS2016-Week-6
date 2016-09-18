class Player < ApplicationRecord
  has_many :registrations
  has_many :tournaments, through: :registrations
end
