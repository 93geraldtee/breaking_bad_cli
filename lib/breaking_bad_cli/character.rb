# we create a character class to instantiate a character based on the info pulled from the API

class BreakingBad::Character 
    attr_accessor :name, :img, :occupation, :status, :nickname, :portrayed

    @@all = []

    def initialize(attributes_hash) 
        attributes_hash.each do |attribute, value| # iterate through each hash with each
            # sets the attribute in api as the attribute in character class, and equal to the value in api and if it responds to that attribute.
            # .send calls the methods in attr_accessor and sets them as the key and equal to its value, and checks if that attribute is there
            self.send("#{attribute}=", value) if self.respond_to?("#{attribute}=") 
            end
        self.save #saves the attribute and value in the @@all array
    end

    def save #saves all instances of character into the @@all (class variable) array
        @@all.push(self)
    end

    def self.all #returns an array of all the character instances
        @@all
    end

    def self.print_all #prints numbered list of all characters
        all.each_with_index do |character, index|
            puts "#{index + 1}. #{character.name}"
        end
    end
end