class CreatePlayerOnHandCards < ActiveRecord::Migration[6.0]
  def change
    create_table :player_on_hand_cards do |t|
      t.references :game_player, index: true
      t.references :card, index: true
      t.timestamps
    end
  end
end
