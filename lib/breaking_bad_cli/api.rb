#getting info from BB API...

class BreakingBad::API

    BASE_URL = "https://breakingbadapi.com/api"

    def all_characters
        response = RestClient.get("https://breakingbadapi.com/api/characters")

        character_array = JSON.parse(response.body) #gets all characters in the array

        character_array.each do |character|
          BreakingBad::Character.new(character)
        end
    end
end
