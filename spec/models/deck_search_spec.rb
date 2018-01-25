require 'rails_helper'

RSpec.describe DeckSearch, type: :model do
  describe 'initialize' do
    it 'creates a DeckSearch object with attributes' do
      params = {color_id: "U,B", budget: 200.5, max_per_card: 12}
      decks = DeckSearch.new(params)

      expect(decks.class).to eq(DeckSearch)
      expect(decks.color_id).to eq(params[:color_id])
      expect(decks.budget).to eq(params[:budget])
      expect(decks.max_per_card).to eq(params[:max_per_card])
    end
  end

  describe 'finder' do

  end
end
