class CreateCardRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :card_requests do |t|
      t.references :game_player, index: true
      t.references :card, index: true
      t.boolean :complied, default: false
      t.timestamps
    end
  end
end
