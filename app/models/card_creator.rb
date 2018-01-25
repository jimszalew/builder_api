class CardCreator

  attr_reader :name,
              :cardTypes,
              :cmc,
              :colorIdentity,
              :manaCost,
              :cardLayout,
              :rulesText,
              :power,
              :toughness,
              :imageName,
              :printings

  def initialize(card)
    @name          = card['name']
    @cardTypes     = card['type']
    @cmc           = card['cmc']
    @colorIdentity = card['colorIdentity']
    @manaCost      = card['manaCost']
    @cardLayout    = card['layout']
    @rulesText     = card['text']
    @power         = card['power']
    @toughness     = card['toughness']
    @imageName     = card['imageName']
    @legalities    = card['legalities']
    @printings     = card['printings']
  end

  def legalities
    if @legalities == nil
      @legalities = "N/A"
    else
      @legalities.map do |pair|
        pair['format'] + ", " + pair['legality']
      end
    end
  end

  def colorIdentity
    if @colorIdentity.class == Array
      @colorIdentity.join(',')
    else
      @colorIdentity
    end
  end
end
