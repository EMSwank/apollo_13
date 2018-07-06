require 'rails_helper'

describe 'user sees all astronauts' do
  describe 'they visit /astronauts' do
    it 'sees a list of astronauts with name, age, job' do
      astronaut = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")

      visit astronauts_path

      expect(page).to have_content(astronaut.name)
      expect(page).to have_content(astronaut.age)
      expect(page).to have_content(astronaut.job)
    end
    it "sees the average age of all astronauts" do
      astronaut_1 = Astronaut.create(name: "Neil Armstrong", age: 30, job: "Commander")
      astronaut_2 = Astronaut.create(name: "Buzz Aldrin", age: 40, job: "Commander")
      average_age = 35

      visit astronauts_path

      expect(page).to have_content("Average Age:#{average_age}") 
    end
    it "sees a list of the space missions in alphabetical order for each astronaut." do
      astronaut_1 = Astronaut.create(name: "Neil Armstrong", age: 30, job: "Commander")
      astronaut_2 = Astronaut.create(name: "Buzz Aldrin", age: 40, job: "Commander")
      mission_1 = astronaut_1.space_missions.create(title: "Apollo 13", trip_length: 15 )
      mission_2 = astronaut_1.space_missions.create(title: "Capricorn 4", trip_length: 20 )
      mission_3 = astronaut_2.space_missions.create(title: "Capricorn 4", trip_length: 20 )
      mission_4 = astronaut_2.space_missions.create(title: "Gemini 7", trip_length: 25 )

      visit astronauts_path

      expect(page).to have_content(mission_1.title)
      expect(page).to have_content(mission_2.title)
      expect(page).to have_content(mission_3.title)
      expect(page).to have_content(mission_4.title)
    end
    
  end
end







# As a visitor,
# When I visit '/astronauts'
# I see a list of the space missions' in alphabetical order for each astronaut.
# (e.g "Apollo 13"
#      "Capricorn 4"
#      "Gemini 7")
# As a visitor,
# When I visit '/astronauts'
# I see the total time in space for each astronaut.
# (e.g. "Total Time in Space: 760 days")