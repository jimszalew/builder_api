require "rails_helper"

describe "DeckCard API", type: :request do
  describe "DELETE deck_card/:id" do
    let(:deck) { create(:deck, color_id: "U,B,R") }
    let(:card) { create(:card, color_id: "U,B,R", card_types: "Legendary Creature", name: "Sedris, the Traitor King")}
    let(:deck_card) { create(:deck_card, deck: deck, card: card, commander: true )}
    context "finds the deck_card record" do
      it "removes the card from the deck" do
        delete "/api/v1/deck_cards/#{deck_card.id}"
        expect(response).to have_http_status(204)
        expect(deck.cards).to eq([])
      end
    end
  end
end
