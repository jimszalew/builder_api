require "rails_helper"

describe "Deck API", type: :request do
  it "returns all decks by params" do

    create(:deck, color_id: "U,B", budget: 150.5, max_per_card: 10.25)
    create(:deck, color_id: "U,B", budget: 250.5, max_per_card: 10.25)
    create(:deck, color_id: "U,B", budget: 350.5, max_per_card: 11.25)
    create(:deck, color_id: "U,B", budget: 450.5, max_per_card: 12.25)
    create(:deck, color_id: "U,B", budget: 550.5, max_per_card: 13.25)
    create(:deck, color_id: "W", budget: 150.5, max_per_card: 10.25)
    create(:deck, color_id: "B", budget: 150.5, max_per_card: 10.25)
    create(:deck, color_id: "U", budget: 150.5, max_per_card: 10.25)
    create(:deck, color_id: "G", budget: 150.5, max_per_card: 10.25)
    create(:deck, color_id: "R", budget: 150.5, max_per_card: 10.25)

    get "/api/v1/deck_search?color_id=U,B"
    expect(response).to be_success
    decks = JSON.parse(response.body)
    expect(decks.count).to eq(5)

    get "/api/v1/deck_search?budget=200"
    expect(response).to be_success
    decks = JSON.parse(response.body)
    expect(decks.count).to eq(6)

    get "/api/v1/deck_search?max_per_card=11"
    expect(response).to be_success
    decks = JSON.parse(response.body)
    expect(decks.count).to eq(7)

    get "/api/v1/deck_search?color_id=U,B&budget=400"
    expect(response).to be_success
    decks = JSON.parse(response.body)
    expect(decks.count).to eq(3)

    get "/api/v1/deck_search?color_id=U,B&max_per_card=13"
    expect(response).to be_success
    decks = JSON.parse(response.body)
    expect(decks.count).to eq(4)

    get "/api/v1/deck_search?budget=400&max_per_card=12"
    expect(response).to be_success
    decks = JSON.parse(response.body)
    expect(decks.count).to eq(8)

    get "/api/v1/deck_search?color_id=U,B&budget=400&max_per_card=12"
    expect(response).to be_success
    decks = JSON.parse(response.body)
    expect(decks.count).to eq(3)
  end
end
