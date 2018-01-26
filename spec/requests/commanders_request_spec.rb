require "rails_helper"

describe "Commanders API", type: :request do
  describe "GET /deck/:id/commanders" do
    it "returns all possible commanders by color params" do
      create_list(:card, 3, card_types: "Legendary Creature", color_id: "W,U,G")
      create_list(:card, 3, card_types: "Legendary Creature", color_id: "W,G")
      create_list(:card, 3, card_types: "Legendary Creature", color_id: "U")
      deck = create(:deck, color_id: "W,U,G")

      get "/api/v1/decks/#{deck.id}/commanders"

      commanders = JSON.parse(response.body)

      expect(commanders.count).to eq(3)
    end
  end
end
