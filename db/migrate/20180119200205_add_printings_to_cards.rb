class AddPrintingsToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :printings, :string, array:true, default: []
  end
end
