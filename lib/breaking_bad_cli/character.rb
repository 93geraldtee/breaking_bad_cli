# we create a character class to instantiate a character based on the info pulled from the API

class BreakingBad::Character 
    attr_accessor :name, :img, :occupation, :status, :nickname, :portrayed

    @@all = []

    def initialize(attributes_hash) 
        attributes_hash.each do |key, value| 
            self.send("#{key}=", value) if self.respond_to?("#{key}=")
        end
        self.save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

end