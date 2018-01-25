require 'rails_helper'

RSpec.describe CardCreator, type: :model do
  let(:card1) {{ "layout": "normal",
                "name": "Rafiq of the Many",
                "manaCost": "{1}{G}{W}{U}",
                "cmc": 4,
                "colors": [
                            "White",
                            "Blue",
                            "Green"
                          ],
                "type": "Legendary Creature — Human Knight",
                "supertypes": [ "Legendary" ],
                "types": [ "Creature" ],
                "subtypes": [
                              "Human",
                              "Knight"
                            ],
                "text": "Exalted (Whenever a creature you control attacks alone, that creature gets +1/+1 until end of turn.)\nWhenever a creature you control attacks alone, it gains double strike until end of turn.",
                "power": "3",
                "toughness": "3",
                "imageName": "rafiq of the many",
                "rulings": [
                              { "date": "2008-10-01", "text": "If you declare exactly one creature as an attacker, each exalted ability on each permanent you control (including, perhaps, the attacking creature itself) will trigger. The bonuses are given to the attacking creature, not to the permanent with exalted. Ultimately, the attacking creature will wind up with +1/+1 for each of your exalted abilities." },
                              { "date": "2008-10-01", "text": "If you attack with multiple creatures, but then all but one are removed from combat, your exalted abilities won't trigger." },
                              { "date": "2008-10-01", "text": "Some effects put creatures onto the battlefield attacking. Since those creatures were never declared as attackers, they're ignored by exalted abilities. They won't cause exalted abilities to trigger. If any exalted abilities have already triggered (because exactly one creature was declared as an attacker), those abilities will resolve as normal even though there may now be multiple attackers." },
                              { "date": "2008-10-01", "text": "Exalted abilities will resolve before blockers are declared." },
                              { "date": "2008-10-01", "text": "Exalted bonuses last until end of turn. If an effect creates an additional combat phase during your turn, a creature that attacked alone during the first combat phase will still have its exalted bonuses in that new phase. If a creature attacks alone during the second combat phase, all your exalted abilities will trigger again." },
                              { "date": "2008-10-01", "text": "In a Two-Headed Giant game, a creature \"attacks alone\" if it's the only creature declared as an attacker by your entire team. If you control that attacking creature, your exalted abilities will trigger but your teammate's exalted abilities won't." }
                            ],
                "printings": [
                               "ALA",
                               "V11"
                             ],
                "legalities": [
                                { "format": "Commander", "legality": "Legal" },
                                { "format": "Legacy", "legality": "Legal" },
                                { "format": "Modern", "legality": "Legal" },
                                { "format": "Shards of Alara Block", "legality": "Legal" },
                                { "format": "Vintage", "legality": "Legal" }
                              ],
                "colorIdentity": [ "W", "U", "G" ]
              }}
  let(:card2) {{ "legalities": nil, "colorIdentity": "W" }}
  let(:creator1) { CardCreator.new(card1) }
  let(:creator2) { CardCreator.new(card2) }

  describe 'initialize' do
    it 'creates a new object with card info' do
      expect(creator1.name).to eq(card1[:name])
      expect(creator1.cardTypes).to eq(card1[:type])
      expect(creator1.cmc).to eq(card1[:cmc])
      expect(creator1.manaCost).to eq(card1[:manaCost])
      expect(creator1.cardLayout).to eq(card1[:layout])
      expect(creator1.rulesText).to eq(card1[:text])
      expect(creator1.power).to eq(card1[:power])
      expect(creator1.toughness).to eq(card1[:toughness])
      expect(creator1.imageName).to eq(card1[:imageName])
      expect(creator1.printings).to eq(card1[:printings])
    end
  end

  describe 'legalities' do
    it 'creates an array of strings of legalities' do
      expect(creator1.legalities).to eq(["Commander, Legal",
                                        "Legacy, Legal",
                                        "Modern, Legal",
                                        "Shards of Alara Block, Legal",
                                        "Vintage, Legal"])
    end

    it 'returns "N/A" if legalities is nil' do
      expect(creator2.legalities).to eq('N/A')
    end
  end

  describe 'colorIdentity' do
    it 'returns a string of the color identities' do
      expect(creator1.colorIdentity).to eq('W,U,G')
    end

    it 'returns a string if input is not an array' do
      expect(creator2.colorIdentity).to eq('W')
    end
  end
end
