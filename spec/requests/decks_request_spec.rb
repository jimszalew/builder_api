require "rails_helper"

describe "Deck API", type: :request do
  it "returns all decks" do
    create_list(:deck, 5)

    get "/api/v1/decks"

    expect(response).to be_success

    decks = JSON.parse(response.body)

    expect(decks.count).to eq(5)
  end

  it "returns a deck by name" do
    create(:deck)
    deck1 = Deck.first

    get "/api/v1/decks/#{deck1.id}"

    expect(response).to be_success

    deck = JSON.parse(response.body)

    expect(deck["name"]).to eq(deck1.name)
  end
end
