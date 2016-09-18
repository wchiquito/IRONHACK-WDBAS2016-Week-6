class Match < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :winner, class_name: 'Player'
  belongs_to :loser, class_name: 'Player'

  validate :player_unique_faction

  private

  def player_unique_faction
    if winner_faction == loser_faction
      errors.add :player, 'player unique faction'
    end
  end
end

=begin
Match.joins :winner
Match.joins(:winner).where(winner_faction: 'protoss').or(Match.joins(:winner).where(loser_faction: 'protoss'))
Match.find_by_sql(['select winner_faction, (count(winner_faction) * 100 / c.total) porcentage from "matches", (select count(id) total from "matches") c where winner_faction = ? group by winner_faction', "protoss"]).pluck(:winner_faction, :porcentage).first
Match.find_by_sql('select winner_faction, (count(winner_faction) * 100 / c.total) porcentage from "matches", (select count(id) total from "matches") c group by winner_faction').pluck(:winner_faction, :porcentage)
=end
