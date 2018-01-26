require 'rails_helper'

RSpec.describe CardSearch, type: :model do

  describe 'initialize' do
    it 'creates a CardSearch object with attributes' do
      params = {colors: "W,U,B", types: "Creature"}
      cards = CardSearch.new(params)

      expect(cards.class).to eq(CardSearch)
      expect(cards.colors).to eq("W,U,B")
      expect(cards.types).to eq("Creature")
    end
  end

  describe 'excluded_colors' do
    it 'returns colors excluded from the search params' do
      params = {colors: "W,U,B", types: "Creature"}
      cards = CardSearch.new(params)

      expect(cards.excluded_colors).to eq(["R","G"])
    end
  end

  describe 'cards_in_colors' do
    it 'returns all cards available in 2 colors' do
      colors_array = ["W","U","B","R","G","W,U","U,B","B,R","R,G","W,G","W,B","U,R","B,G","W,R","U,G","W,U,B","U,B,R","B,R,G","W,R,G","W,U,G","W,U,R","W,B,G","W,B,R","U,B,G","U,R,G"]
      colors_array.each do |color|
        create(:card, color_id: color)
      end

      params = {colors: "W,U"}
      cards = CardSearch.new(params)

      expect(cards.cards_in_colors.count).to eq(3)
    end

    it 'returns all cards available in 3 colors' do
      colors_array = ["W","U","B","R","G","W,U","U,B","B,R","R,G","W,G","W,B","U,R","B,G","W,R","U,G","W,U,B","U,B,R","B,R,G","W,R,G","W,U,G","W,U,R","W,B,G","W,B,R","U,B,G","U,R,G"]
      colors_array.each do |color|
        create(:card, color_id: color)
      end

      params = {colors: "W,U,B"}
      cards = CardSearch.new(params)

      expect(cards.cards_in_colors.count).to eq(7)
    end

    it 'returns all cards available in 4 colors' do
      colors_array = ["W","U","B","R","G","W,U","U,B","B,R","R,G","W,G","W,B","U,R","B,G","W,R","U,G","W,U,B","U,B,R","B,R,G","W,R,G","W,U,G","W,U,R","W,B,G","W,B,R","U,B,G","U,R,G"]
      colors_array.each do |color|
        create(:card, color_id: color)
      end

      params = {colors: "W,U,B,R"}
      cards = CardSearch.new(params)

      expect(cards.cards_in_colors.count).to eq(14)
    end
  end

  # describe 'commanders(deck)' do
  #   it 'returns all Legendary creatures matching the deck params' do
  #     create_list(:card, 3, card_types: "Legendary Creature", color_id: "W,U,G")
  #     create_list(:card, 3, card_types: "Legendary Creature", color_id: "W,G")
  #     create_list(:card, 3, card_types: "Legendary Creature", color_id: "U")
  #     deck = create(:deck, color_id: "W,U,G")
  #   end
  # end
end
