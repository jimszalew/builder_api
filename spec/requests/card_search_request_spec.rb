require "rails_helper"

describe "Card API", type: :request do
  it "returns all cards available by colors" do
    colors_array = ["W","U","B","R","G","W,U","U,B","B,R","R,G","W,G","W,B","U,R","B,G","W,R","U,G","W,U,B","U,B,R","B,R,G","W,R,G","W,U,G","W,U,R","W,B,G","W,B,R","U,B,G","U,R,G"]
    colors_array.each do |color|
      create(:card, color_id: color)
    end

    get "/api/v1/card_search?colors=W,U,B"

    expect(response).to be_success

    cards = JSON.parse(response.body)

    expect(cards.count).to eq(7)
  end

  it "returns all cards by type" do
    create_list(:card, 3, card_types: "Instant")
    create_list(:card, 3, card_types: "Artifact")
    create_list(:card, 3, card_types: "Sorcery")
    create_list(:card, 3, card_types: "Creature")

    get "/api/v1/card_search?types=Instant"

    expect(response).to be_success

    cards = JSON.parse(response.body)

    expect(cards.count).to eq(3)
  end

  it "returns cards by both type and color" do
    colors_array = ["W","U","B","R","G","W,U","U,B","B,R","R,G","W,G","W,B","U,R","B,G","W,R","U,G","W,U,B","U,B,R","B,R,G","W,R,G","W,U,G","W,U,R","W,B,G","W,B,R","U,B,G","U,R,G"]
    colors_array.each do |color|
      create_list(:card, 3, color_id: color, card_types: "Instant")
      create_list(:card, 3, color_id: color, card_types: "Artifact")
    end

    get "/api/v1/card_search?types=Instant&colors=W,U,B"

    expect(response).to be_success

    cards = JSON.parse(response.body)

    expect(cards.count).to eq(21)
  end
end
