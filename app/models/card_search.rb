class CardSearch
  def self.finder(params)
    # require "pry"; binding.pry
    colors = []
    types = []
    colors << self.cards_by_color(params['colors'])[0]
    types << self.cards_by_types(params['types'])[0]
    colors + types
  end

  def self.cards_by_color(colors)
    colors_array = colors.split(',')
    all_combos = (1..5).flat_map{|n| colors_array.repeated_permutation(n).map(&:join)}
    all_combos.delete_if { |combo| combo.split(//).uniq.length != combo.split(//).length }
    uniq_combos = all_combos.map { |combo| combo.split(//).sort }.uniq.map { |combo| combo.join(',') }
    cards = []
    uniq_combos.map do |color|
      cards << Card.where(colorIdentity: color)
    end
  end

  def self.cards_by_types(types)
    card_types = types.split(',')
    cards = []
    card_types.each do |tipe|
      cards << Card.where("cardTypes LIKE ?", "%#{tipe}%")
    end
    require "pry"; binding.pry
  end
end
