class CreateDecks < ActiveRecord::Migration[5.1]
  def change
    create_table :decks do |t|
      t.float :budget
      t.float :max_per_card
      t.string :color_id

      t.timestamps
    end
  end
end
