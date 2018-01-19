class Card < ApplicationRecord
  # before_create :set_slug
  #
  # private
  #
  #     def set_slug
  #       self.slug = self.name.parameterize
  #     end
  extend FriendlyId
  friendly_id :name, use: :slugged
end
