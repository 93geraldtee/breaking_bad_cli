class BreakingBad::Character
    attr_accessor :name, :img, :occupation, :status, :nickname, :portrayed

    @@all = []

    def initialize(attributes)
        attributes.each { |key, value| self.send("#{key}=", value) if self.respond_to?("#{key}=") }
        self.save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

end