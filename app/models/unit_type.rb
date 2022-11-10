class UnitType < ApplicationRecord
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

  scope :battle_armor, -> { where(name: MECH) }
  scope :conventional_fighters, -> { where(name: CONVENTIONAL_FIGHTER) }
  scope :dropships, -> { where(name: DROPSHIP) }
  scope :fighters, -> { where(name: FIGHTER) }
  scope :infantry, -> { where(name: INFANTRY) }
  scope :jump_ships, -> { where(name: JUMP_SHIP) }
  scope :mechs, -> { where(name: MECH) }
  scope :proto_mechs, -> { where(name: PROTO_MECH) }
  scope :small_craft, -> { where(name: SMALL_CRAFT) }
  scope :space_stations, -> { where(name: SPACE_STATION) }
  scope :turrets, -> { where(name: TURRET) }
  scope :unofficial, -> { where(name: UNOFFICIAL) }
  scope :vehicles, -> { where(name: VEHICLE) }
  scope :warships, -> { where(name: WARSHIP) }

  has_many :units

  validates_presence_of :name
end
