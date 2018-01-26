require "rails_helper"

describe "Deck API", type: :request do
  describe "GET /decks" do
    it "returns all decks" do
      create_list(:deck, 5)

      get "/api/v1/decks"

      expect(response).to have_http_status(200)

      decks = JSON.parse(response.body)

      expect(decks.count).to eq(5)
    end
  end

  describe "GET /decks/:id" do
    it "returns a single deck by id" do
      create(:deck)
      deck1 = Deck.first

      get "/api/v1/decks/#{deck1.id}"

      expect(response).to have_http_status(200)

      deck = JSON.parse(response.body)

      expect(deck["color_id"]).to eq(deck1.color_id)
    end
  end

  describe "POST /decks" do
    let(:attributes) {{color_id: "W,U,G", budget: 350.75, max_per_card: 25}}
    context "with valid info" do
      it "creates a new deck" do
        post "/api/v1/decks", params: attributes

        expect(response).to have_http_status(201)

        deck = JSON.parse(response.body)

        expect(deck['color_id']).to eq("W,U,G")
        expect(deck['budget']).to eq(350.75)
        expect(deck['max_per_card']).to eq(25)
      end
    end
  end

  describe "PUT /decks/:id" do
    let(:deck) { create(:deck, color_id: "U,B,R") }
    let(:card) { create(:card, color_id: "U,B,R", card_types: "Legendary Creature", name: "Sedris, the Traitor King")}
    context "from a list of available commanders" do
      it "adds the commander to the deck" do
        put "/api/v1/decks/#{deck.id}", params: { card_id: card.id, commander: true}

        expect(response).to have_http_status(204)

        expect(deck.cards.first.name).to eq(card.name)
      end
    end
  end
end
