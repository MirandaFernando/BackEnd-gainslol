require 'rails_helper'

RSpec.describe League, type: :model do
  describe 'validations' do
    subject { League.create(name:'CBLOL') } 
    it { should validate_presence_of(:name)}
    it { should validate_uniqueness_of(:name)}
  end

end
