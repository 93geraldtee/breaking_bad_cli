#getting info from BB API...

class BreakingBad::API

    url = "https://breakingbadapi.com/api"

    def all_characters
        response = RestClient.get("https://breakingbadapi.com/api/characters")

        character_array = JSON.parse(response.body) #gets all characters in the array

        character_array.each do |character|
          BreakingBad::Character.new(character)
        end
    end
    # binding.pry

    def quote
        response = RestClient.get("https://breakingbadapi.com/api/quote/random")

        quote_array = JSON.parse(response.body)

        quote_array
        binding.pry
    end
end
