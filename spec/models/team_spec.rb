require 'rails_helper'

RSpec.describe Team, type: :model do
  
  #subject(:team){ build :team } 

  describe 'validations' do
    let!(:team) { create(:team) }
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:league_id)}
    it { should validate_uniqueness_of(:name)}
    it { should belong_to(:league) }
  end
end
