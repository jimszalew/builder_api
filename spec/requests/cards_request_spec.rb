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

  it "returns all cards available by colors" do
    mono = ["W","U","B","R","G"]
    mono.each do |color|
      create(:card, colorIdentity: color)
    end

    pairs = ["W,U","U,B","B,R","R,G","W,G","W,B","U,R","B,G","W,R","U,G"]
    pairs.each do |color|
      create(:card, colorIdentity: color)
    end

    trips = ["W,U,B","U,B,R","B,R,G","W,R,G","W,U,G","W,U,R","W,B,G","W,B,R","U,B,G","U,R,G",]
    trips.each do |color|
      create(:card, colorIdentity: color)
    end

    get "/api/v1/card_search?colors=W,U,B"
require "pry"; binding.pry
    expect(response).to be_success

    cards = JSON.parse(response.body)

    expect(cards.count).to eq(7)
  end

  # xit "returns all cards by one type" do
  #   create_list(:card, 3, cardTypes: "Instant")
  #   create_list(:card, 3, cardTypes: "Artifact")
  #   create_list(:card, 3, cardTypes: "Sorcery")
  #   create_list(:card, 3, cardTypes: "Creature")
  #
  #   get "/api/v1/card_search?types=Instant"
  #
  #   expect(response).to be_success
  #
  #   cards = JSON.parse(response.body)
  #
  #   expect(cards.count).to eq(3)
  # end
end
