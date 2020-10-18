class AddDeckIdToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :deck_id, :string
  end
end
