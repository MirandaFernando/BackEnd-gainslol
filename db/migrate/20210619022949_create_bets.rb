class CreateBets < ActiveRecord::Migration[6.1]
  def change
    create_table :bets do |t|
      t.date :game_date
      t.string :league
      t.string :style
      t.string :winner
      t.string :loser
      t.string :result_bet
      t.float :input
      t.float :odd
      t.float :profit
      t.text :comment
      
      t.timestamps
    end
  end
end
