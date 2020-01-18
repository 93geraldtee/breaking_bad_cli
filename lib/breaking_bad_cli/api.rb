# this method gets the character and details from the API

class BreakingBad::API

    url = "https://breakingbadapi.com/api"

    def all_characters

        character_array = JSON.parse(RestClient.get("https://breakingbadapi.com/api/characters").body)
        # OR
        # all_char_array = RestClient.get("https://breakingbadapi.com/api/characters") # convention from restclient doc
        # character_array = JSON.parse(response.body) # parses all characters in the array

        # iterate through each character in the character array, and create a new character instance of that character in my program
        character_array.each do |character| 
          BreakingBad::Character.new(character)
          # binding.pry
        end
    end
end

