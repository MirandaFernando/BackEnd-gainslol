require 'rails_helper'

RSpec.describe Bet, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:game_date) }
    it { should validate_presence_of(:input) }
    it { should validate_presence_of(:odd) }

  end

end
