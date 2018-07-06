class Astronaut < ApplicationRecord

  has_many :space_mission_astronauts
  has_many :space_missions, through: :space_mission_astronauts

  def self.average_age
    average(:age)
  end
end
