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
end
