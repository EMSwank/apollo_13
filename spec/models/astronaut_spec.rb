require 'rails_helper'

describe Astronaut, type: :model do
  describe 'class methods' do
    it '.average_age' do
      astronaut_1 = Astronaut.create(name: "Neil Armstrong", age: 40, job: "Commander")
      astronaut_1 = Astronaut.create(name: "Buzz Aldrin", age: 50, job: "Commander")
      average_age = 45

      expect(Astronaut.average_age).to eq(average_age)

    end
  end
end