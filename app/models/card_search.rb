class CardSearch

  attr_reader :colors, :types, :deck_id

  def initialize(params)
    @colors  = params[:colors]
    @types   = params[:types]
    @deck_id = params[:deck_id]
  end

  def excluded_colors
    all_colors = ["W","U","B","R","G"]
    search = colors.split(',')
    (all_colors - search)
  end

  def deck_excluded_colors
    all_colors = ["W","U","B","R","G"]
    search = deck.color_id.split(',')
    (all_colors - search)
  end

  def cards_in_colors
    cards = []
    excluded_colors.map do |color|
      cards << Card.where.not("color_id LIKE ?", "%#{color}%")
    end
    array = cards.flatten
    array.select{ |e| array.count(e) >= excluded_colors.count }.uniq
  end

  def cards_by_types
    cards = []
    type_array = types.split(',')
    type_array.map do |card_type|
      cards << Card.where("card_types LIKE ?", "%#{card_type}%")
    end
    cards.flatten
  end

  def cards_in_deck_colors
    cards = []
    deck_excluded_colors.map do |color|
      cards << Card.where.not("color_id LIKE ?", "%#{color}%")
    end
    array = cards.flatten
    array.select{ |e| array.count(e) >= deck_excluded_colors.count }.uniq
  end

  def finder
    if types.present? && colors.present? && !deck_id.present?
      array = cards_in_colors + cards_by_types
      array.select{ |e| array.count(e) > 1 }.uniq
    elsif types.present? && !colors.present? && !deck_id.present?
      cards_by_types
    elsif colors.present? && !types.present? && !deck_id.present?
      cards_in_colors
    elsif deck_id.present? && types.present? && !colors.present?
      array = cards_in_deck_colors + cards_by_types
      array.select{ |e| array.count(e) > 1 }.uniq
    elsif deck_id.present? && !types.present? && !colors.present?
      cards_in_deck_colors
    end
  end

  def commanders
    Card.where("card_types LIKE ?", "%Legendary%")
        .where("card_types LIKE ?", "%Creature%")
        .where(color_id: colors)
  end

  def deck
    Deck.find(deck_id)
  end
end
