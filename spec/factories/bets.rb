FactoryBot.define do
  factory :bet do
    game_date { Faker::Date.between }
    league {Faker::Esport.league }
    style { 'match winner' }
    winner {Faker::Esport.team}
    loser {Faker::Esport.team}
    result_bet { 'Loading' }
    input {Faker::Number.decimal }
    odd { 1.8 }
    profit
    comment { 'Nunca mais apostar nesse time'}
    user
  end
end
