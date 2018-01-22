class ChangeCardColumns < ActiveRecord::Migration[5.1]
  def change
    rename_column :cards, :cardTypes, :card_types
    rename_column :cards, :colorIdentity, :color_id
    rename_column :cards, :manaCost, :mana_cost
    rename_column :cards, :cardLayout, :card_layout
    rename_column :cards, :rulesText, :rules_text
  end
end
