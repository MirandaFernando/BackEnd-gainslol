class AddWimrateToTeam < ActiveRecord::Migration[6.1]
  def change
    add_column :teams, :wimrate, :float
    add_column :teams, :first_drag, :float
    add_column :teams, :first_tower, :float
  end
end
