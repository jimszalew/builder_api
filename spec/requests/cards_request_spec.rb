require "rails_helper"

describe "Card API", type: :request do
  it "returns all cards" do
    create_list(:card, 20)

    get "/api/v1/cards"

    expect(response).to be_success

    cards = JSON.parse(response.body)

    expect(cards.count).to eq(20)
  end

  # it "returns a card by name" do
  # end
  # it "returns all cards by color" do
  # end
  # it "returns all cards by card type" do
  # end
end
