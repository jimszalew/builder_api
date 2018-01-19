class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :cardTypes
      t.integer :cmc
      t.string :colorIdentity
      t.string :manaCost
      t.string :cardLayout
      t.string :rulesText
      t.string :power
      t.string :toughness
      t.string :imageName

      t.timestamps
    end
  end
end
