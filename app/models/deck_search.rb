class DeckSearch

  attr_reader :color_id, :budget, :max_per_card

  def initialize(params)
    @color_id = params[:color_id]
    @budget = params[:budget]
    @max_per_card = params[:max_per_card]
  end

  def finder
    if color_id.present? && budget.present? && max_per_card.present?
      Deck.where(color_id: color_id).where("budget < ?", "#{budget}").where("max_per_card < ?", "#{max_per_card}")
    elsif color_id.present? && budget.present? && !max_per_card.present?
      Deck.where(color_id: color_id).where("budget < ?", "#{budget}")
    elsif color_id.present? && !budget.present? && max_per_card.present?
      Deck.where(color_id: color_id).where("max_per_card < ?", "#{max_per_card}")
    elsif !color_id.present? && budget.present? && max_per_card.present?
      Deck.where("budget < ?", "#{budget}").where("max_per_card < ?", "#{max_per_card}")
    elsif color_id.present? && !budget.present? && !max_per_card.present?
      Deck.where(color_id: color_id)
    elsif !color_id.present? && !budget.present? && max_per_card.present?
      Deck.where("max_per_card < ?", "#{max_per_card}")
    elsif !color_id.present? && budget.present? && !max_per_card.present?
      Deck.where("budget < ?", "#{budget}")
    end
  end
end
