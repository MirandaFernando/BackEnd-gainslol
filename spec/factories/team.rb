FactoryBot.define do
    factory :team do
        name    
        league

        factory :invalid_team do
            name { nil }
        end
    end
end