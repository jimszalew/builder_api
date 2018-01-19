FactoryBot.define do
  factory :card do
    sequence :name do |n|
      "Card #{n}"
    end

    sequence :cardTypes do |n|
      "#{n},#{n + 1},#{n + 2}"
    end

    cmc 1

    sequence :colorIdentity do |n|
      "#{n},#{n + 1},#{n + 2}"
    end

    sequence :manaCost do |n|
      "#{n},#{n + 1},#{n + 2}"
    end

    sequence :rulesText do |n|
      "Deals #{n} damage"
    end

    power "1"
    toughness "1"

    sequence :imageName do |n|
      "image #{n}"
    end
  end
end
