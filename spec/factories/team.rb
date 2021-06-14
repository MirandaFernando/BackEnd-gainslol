FactoryBot.define do
    factory :team do
        name {Faker::Esport.team}
        league

        factory :invalid_team do
            name { nil }
        end
    end
end