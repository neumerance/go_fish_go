class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.boolean :in_progress, default: false
      t.timestamps
    end
  end
end
