require 'rails_helper'

RSpec.describe League, type: :model do
    
    describe 'callbacks' do
        context 'before_validation' do
          it 'should set uid as email' do
            user = User.new attributes_for :user_without_uid
            expect(user.uid).to eq('')
            user.save
            expect(user.uid).to eq(user.email)
          end
        end
    end
end



