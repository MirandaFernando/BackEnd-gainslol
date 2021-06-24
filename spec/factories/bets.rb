FactoryBot.define do
  factory :bet do
    game_date { 'Thu, 21 Jun 0014' }
    league {Faker::Esport.league }
    style { 'match winner' }
    winner {Faker::Esport.team}
    loser {Faker::Esport.team}
    result_bet { 'Loading' }
    input {Faker::Number.decimal }
    odd { 1.8 }
    profit { 5 }
    comment { 'Nunca mais apostar nesse time'}
    user

    factory :invalid_bet do
      game_date { nil }
      input { nil }
      odd { nil }
    end

  end
end
