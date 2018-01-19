class AddSlugToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :slug, :string, null: false
    add_index :cards, :slug, unique: true
  end
end
