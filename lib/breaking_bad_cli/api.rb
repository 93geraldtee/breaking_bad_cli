# require 'rest-client'
# require 'JSON'
# require 'pry'
# require_relative './character.rb'

#getting info from BB API...

class BreakingBadApi::API

    BASE_URL = "https://breakingbadapi.com/api"

    def all_characters
        response = RestClient.get("https://breakingbadapi.com/api/characters")

        character_array = JSON.parse(response.body) #gets all characters in the array

        character_array.each do |character|
          BreakingBadAPI::Character.new(character)
        end
    end
end

binding.pry

# puts "hello"