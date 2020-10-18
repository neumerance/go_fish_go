class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :value
      t.string :image
      t.string :suit
      t.string :code
      t.timestamps
    end
  end
end
