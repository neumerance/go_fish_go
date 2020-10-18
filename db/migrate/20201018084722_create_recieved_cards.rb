class CreateRecievedCards < ActiveRecord::Migration[6.0]
  def change
    create_table :recieved_cards do |t|
      t.references :game_player, index: true
      t.references :card, index: true
      t.boolean :recieved, default: false
      t.timestamps
    end
  end
end
