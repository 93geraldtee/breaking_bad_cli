#getting info from BB API...

class BreakingBad::API

    BASE_URL = "https://breakingbadapi.com/api"

    def all_characters
        response = RestClient.get("https://breakingbadapi.com/api/characters/1")

        character_array = JSON.parse(response.body) #gets all characters in the array

        character_array.each do |character|
          BreakingBad::Character.new(character)
        #   binding.pry
        end
    end
end
