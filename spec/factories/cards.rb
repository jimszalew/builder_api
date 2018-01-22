FactoryBot.define do
  factory :card do
    sequence :name do |n|
      "Card #{n}"
    end

    sequence :card_types do |n|
      "#{n},#{n + 1},#{n + 2}"
    end

    cmc 1

    sequence :color_id do |n|
      "#{n},#{n + 1},#{n + 2}"
    end

    sequence :mana_cost do |n|
      "#{n},#{n + 1},#{n + 2}"
    end

    sequence :rules_text do |n|
      "Deals #{n} damage"
    end

    power "1"
    toughness "1"

    sequence :imageName do |n|
      "image #{n}"
    end
  end
end
