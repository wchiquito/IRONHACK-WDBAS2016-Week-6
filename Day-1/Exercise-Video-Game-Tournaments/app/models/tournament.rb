class Tournament < ApplicationRecord
  has_many :registrations
  has_many :players, through: :registrations
end
