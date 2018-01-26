raw_cards = File.read('./db/cards.json')

json_cards = ActiveSupport::JSON.decode(raw_cards).values

json_cards.each do |card|
  card_info = CardCreator.new(card)

  Card.create(name: card_info.name,
              card_types: card_info.cardTypes,
              cmc: card_info.cmc,
              color_id: card_info.colorIdentity,
              mana_cost: card_info.manaCost,
              card_layout: card_info.cardLayout,
              rules_text: card_info.rulesText,
              power: card_info.power,
              toughness: card_info.toughness,
              imageName: card_info.imageName,
              printings: card_info.printings,
              legalities: card_info.legalities)
  puts "#{card['name']} added to the database"
end

color_combos = ["W","U","B","R","G","W,U","U,B","B,R","R,G","W,G","W,B","U,R","B,G","W,R","U,G","W,U,B","U,B,R","B,R,G","W,R,G","W,U,G","W,U,R","W,B,G","W,B,R","U,B,G","U,R,G","W,U,B,R","W,U,B,G","W,B,R,G","W,U,R,G","U,B,R,G","W,U,B,R,G"]

31.times do
  Deck.create(budget: rand(100..1000),
              max_per_card: rand(1..50),
              color_id: color_combos.sample)
end
