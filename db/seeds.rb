raw_cards = File.read('./db/cards.json')

json_cards = ActiveSupport::JSON.decode(raw_cards).values

json_cards.each do |card|
  card_info = CardCreator.new(card)

  Card.create(name: card_info.name,
              cardTypes: card_info.cardTypes,
              cmc: card_info.cmc,
              colorIdentity: card_info.colorIdentity,
              manaCost: card_info.manaCost,
              cardLayout: card_info.cardLayout,
              rulesText: card_info.rulesText,
              power: card_info.power,
              toughness: card_info.toughness,
              imageName: card_info.imageName,
              printings: card_info.printings,
              legalities: card_info.legalities)
  puts "#{card['name']} added to the database"
end
