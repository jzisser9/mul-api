require 'open-uri'

class Unit < ApplicationRecord
  BATTLE_ARMOR = 'battlearmor'
  CONVENTIONAL_FIGHTER = 'convfighter'
  DROPSHIP = 'dropships'
  FIGHTER = 'fighters'
  INFANTRY = 'infantry'
  JUMP_SHIP = 'jumpships'
  MECH = 'mechs'
  PROTO_MECH = 'protomechs'
  SMALL_CRAFT = 'smallcraft'
  SPACE_STATION = 'spacestation'
  TURRET = 'ge'
  UNOFFICIAL = 'unofficial'
  VEHICLE = 'vehicles'
  WARSHIP = 'warship'

  scope :battle_armor, -> { where(unit_type: MECH) }
  scope :conventional_fighters, -> { where(unit_type: CONVENTIONAL_FIGHTER) }
  scope :dropships, -> { where(unit_type: DROPSHIP) }
  scope :fighters, -> { where(unit_type: FIGHTER) }
  scope :infantry, -> { where(unit_type: INFANTRY) }
  scope :jump_ships, -> { where(unit_type: JUMP_SHIP) }
  scope :mechs, -> { where(unit_type: MECH) }
  scope :proto_mechs, -> { where(unit_type: PROTO_MECH) }
  scope :small_craft, -> { where(unit_type: SMALL_CRAFT) }
  scope :space_stations, -> { where(unit_type: SPACE_STATION) }
  scope :turrets, -> { where(unit_type: TURRET) }
  scope :unofficial, -> { where(unit_type: UNOFFICIAL) }
  scope :vehicles, -> { where(unit_type: VEHICLE) }
  scope :warships, -> { where(unit_type: WARSHIP) }

  def image_url
    doc = Nokogiri::HTML(URI.open(mul_custom_card_link))
    doc.search('#Data_Image').first.content.gsub("\r\n", '')
  end

  def mul_link
    "http://masterunitlist.info/Unit/Details/#{mul_id}/"
  end

  def mul_custom_card_link
    "http://masterunitlist.info/Tools/CustomCard/#{mul_id}"
  end
end
