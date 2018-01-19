class AddCardLegalities < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :legalities, :string, array:true, default: []
  end
end
