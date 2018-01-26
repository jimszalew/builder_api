class DeckCard < ApplicationRecord
  belongs_to :deck, required: false
  belongs_to :card, required: false
end
