require 'rails_helper'

RSpec.describe DeckCard, type: :model do
  it { should belong_to(:deck) }
  it { should belong_to(:card) }
end
