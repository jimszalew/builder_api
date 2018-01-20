class CardSearch
  def self.finder(params)
    require "pry"; binding.pry
    if params['colors']
      self.cards_by_color(params['colors'])
    end
    if params['types']
      self.cards_by_types(params['types'])
    end
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

  # def cards_by_color(colors)
  #   colors_array = colors.split(',')
  #   all_combos = (1..5).flat_map{|n| colors_array.repeated_permutation(n).map(&:join)}
  #   all_combos.delete_if { |combo| combo.split(//).uniq.length != combo.split(//).length }
  #   uniq_combos = all_combos.map { |combo| combo.split(//).sort }.uniq.map { |combo| combo.join(',') }
  #   cards = []
  #   uniq_combos.map do |color|
  #     cards << Card.where(colorIdentity: color)
  #   end
  # end

  def self.cards_by_types(types)
    require "pry"; binding.pry
  end

end
