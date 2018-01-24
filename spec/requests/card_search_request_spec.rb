require "rails_helper"

describe "Card API", type: :request do
  it "returns all cards available by colors" do
    mono = ["W","U","B","R","G"]
    mono.each do |color|
      create(:card, color_id: color)
    end

    pairs = ["W,U","U,B","B,R","R,G","W,G","W,B","U,R","B,G","W,R","U,G"]
    pairs.each do |color|
      create(:card, color_id: color)
    end

    trips = ["W,U,B","U,B,R","B,R,G","W,R,G","W,U,G","W,U,R","W,B,G","W,B,R","U,B,G","U,R,G",]
    trips.each do |color|
      create(:card, color_id: color)
    end

    get "/api/v1/card_search?colors=W,U,B"

    expect(response).to be_success

    cards = JSON.parse(response.body)

    expect(cards.count).to eq(7)
  end

  xit "returns all cards by one type" do
    create_list(:card, 3, card_types: "Instant")
    create_list(:card, 3, card_types: "Artifact")
    create_list(:card, 3, card_types: "Sorcery")
    create_list(:card, 3, card_types: "Creature")

    get "/api/v1/card_search?types=Instant"

    expect(response).to be_success

    cards = JSON.parse(response.body)

    expect(cards.count).to eq(3)
  end
end
