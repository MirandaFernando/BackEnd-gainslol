class AddUserRefToBet < ActiveRecord::Migration[6.1]
  def change
    add_reference :bets, :user, null: false, foreign_key: true
  end
end
