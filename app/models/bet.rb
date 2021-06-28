class Bet < ApplicationRecord
    belongs_to :user

    validates :game_date, presence: true
    validates :input, presence: true
    validates :odd, presence: true 
end

