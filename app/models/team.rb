class Team < ApplicationRecord
    belongs_to :league
    validates_associated :league
    validates :name, presence: true
    validates :league_id, presence: true
    validates :name, uniqueness: true
     
end
