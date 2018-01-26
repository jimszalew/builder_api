class CardSearch

  attr_reader :colors, :types

  def initialize(params)
    @colors = params[:colors]
    @types  = params[:types]
  end

  def excluded_colors
    all_colors = ["W","U","B","R","G"]
    search = colors.split(',')
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

  def finder
    if types.present? && colors.present?
      array = cards_in_colors + cards_by_types
      array.select{ |e| array.count(e) > 1 }.uniq
    elsif types.present? && !colors.present?
      cards_by_types
    elsif colors.present? && !types.present?
      cards_in_colors
    end
  end

  def commanders
    Card.where("card_types LIKE ?", "%Legendary%")
        .where("card_types LIKE ?", "%Creature%")
        .where(color_id: colors)
  end
end
