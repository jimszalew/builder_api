require "rails_helper"

describe "Card API", type: :request do
  it "returns all cards" do
    create_list(:card, 5)

    get "/api/v1/cards"

    expect(response).to be_success

    cards = JSON.parse(response.body)

    expect(cards.count).to eq(5)
  end

  it "returns a card by name" do
    create(:card)
    card1 = Card.first

    get "/api/v1/cards/#{card1.slug}"

    expect(response).to be_success

    card = JSON.parse(response.body)

    expect(card["name"]).to eq(card1.name)
  end
end
