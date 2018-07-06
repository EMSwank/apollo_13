class SpaceMission < ApplicationRecord

  has_many :space_mission_astronauts
  has_many :astronauts, through: :space_mission_astronauts

end
