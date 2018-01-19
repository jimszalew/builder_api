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
    @cardLayout    = card['cardLayout']
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
        string = ","
        pair['format'] + string + pair['legality']
      end
    end
  end

  # def name
  #   if @name.class == Array
  #     @name.join(',')
  #   else
  #     @name
  #   end
  # end
  # def cardTypes
  #   if @cardTypes.class == Array
  #     @cardTypes.join(',')
  #   else
  #     @cardTypes
  #   end
  # end
  # def cmc
  #   if @cmc.class == Array
  #     @cmc.join(',')
  #   else
  #     @cmc
  #   end
  # end
  def colorIdentity
    if @colorIdentity.class == Array
      @colorIdentity.join(',')
    else
      @colorIdentity
    end
  end
  # def manaCost
  #   if @manaCost.class == Array
  #     @manaCost.join(',')
  #   else
  #     @manaCost
  #   end
  # end
  # def cardLayout
  #   if @cardLayout.class == Array
  #     @cardLayout.join(',')
  #   else
  #     @cardLayout
  #   end
  # end
  # def rulesText
  #   if @rulesText.class == Array
  #     @rulesText.join(',')
  #   else
  #     @rulesText
  #   end
  # end
  # def power
  #   if @power.class == Array
  #     @power.join(',')
  #   else
  #     @power
  #   end
  # end
  # def toughness
  #   if @toughness.class == Array
  #     @toughness.join(',')
  #   else
  #     @toughness
  #   end
  # end
  # def imageName
  #   if @imageName.class == Array
  #     @imageName.join(',')
  #   else
  #     @imageName
  #   end
  # end
  # def printings
  #   if @printings.class == Array
  #     @printings.join(',')
  #   else
  #     @printings
  #   end
  # end
end
