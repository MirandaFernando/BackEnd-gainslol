class BetSerializer < ActiveModel::Serializer
  attributes :id, :game_date, :league, :style, :winner, :loser, :result_bet, :input, :odd, :profit, :comment
end
