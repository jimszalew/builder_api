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
end

# class CardSearch
#   def self.finder(params)
#     by_color = []
#     by_types = []
#     if params['colors'].present?
#       by_color = self.cards_by_color(params['colors'])
#     end
#     if params['types'].present?
#       by_types = self.cards_by_types(params['types'])
#     end
#     (by_color + by_types).uniq
#   end
#
#   def self.cards_by_color(colors)
#     colors_array = colors.split(',')
#     all_combos = (1..5).flat_map{|n| colors_array.repeated_permutation(n).map(&:join)}
#     all_combos.delete_if { |combo| combo.split(//).uniq.length != combo.split(//).length }
#     uniq_combos = all_combos.map { |combo| combo.split(//).sort }.uniq.map { |combo| combo.join(',') }
#     cards = []
#     uniq_combos.map do |color|
#       cards << Card.where(color_id: color)
#     end
#     cards
#   end
#
#   def self.cards_by_types(types)
#     card_types = types.split(',')
#     cards = []
#     card_types.each do |tipe|
#       cards << Card.where("card_types LIKE ?", "%#{tipe}%")
#     end
#     cards[0].uniq
#   end
# end
