require "rails_helper"

describe "Deck API", type: :request do
  describe "GET /decks" do
    it "returns all decks" do
      create_list(:deck, 5)

      get "/api/v1/decks"

      expect(response).to be_success

      decks = JSON.parse(response.body)

      expect(decks.count).to eq(5)
    end
  end

  describe "GET /decks/:id" do
    it "returns a single deck by id" do
      create(:deck)
      deck1 = Deck.first

      get "/api/v1/decks/#{deck1.id}"

      expect(response).to be_success

      deck = JSON.parse(response.body)

      expect(deck["color_id"]).to eq(deck1.color_id)
    end
  end

  describe "POST /decks" do
    let(:valid_attributes) {{color_id: "W,U,G", budget: 350.75, max_per_card: 25}}
    context "with valid info" do
      it "creates a new deck" do
        post "/api/v1/decks", params: valid_attributes

        expect(response).to be_success

        deck = JSON.parse(response.body)

        expect(deck['color_id']).to eq("W,U,G")
        expect(deck['budget']).to eq(350.75)
        expect(deck['max_per_card']).to eq(25)
      end
    end
  end
end
