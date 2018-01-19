class CardSearch
  def self.cards_by_color_identity(colors)
    colors_array = colors.split(',')
    all_combos = (1..5).flat_map{|n| colors_array.repeated_permutation(n).map(&:join)}
    all_combos.delete_if { |combo| combo.split(//).uniq.length != combo.split(//).length }
    uniq_combos = all_combos.map { |combo| combo.split(//).sort }.uniq.map { |combo| combo.join(',') }
    cards = []
    uniq_combos.map do |color|
      cards << Card.where(color_identity: color).order(:name)
    end
    require "pry"; binding.pry
  end
end