class BreakingBad::CLI
    def start #starts the CLI
        system('clear') #clears terminal
        puts " ------------------------------------------------- "
        puts "|                                                 |"
        puts "|        Yo, this is the Breaking Bad API!        |"
        puts "|              Yeah, computers! - Jesse           |"
        puts "|                                                 |"
        puts " ------------------------------------------------- "

        BreakingBad::API.new.all_characters #gathers data from API  

        main_menu
    end

    def main_menu #main menu is shown to the user
        puts ""
        puts "Would you like to see all the characters?"
        puts "Type 'y' to continue"
        puts "Type 'exit' to quit the program"

        main_menu_input
    end

    def main_menu_input #what the user inputs from main menu
        input = gets.strip

        if input.downcase == "y" #shows list of characters from API and a sub menu
            list_characters
            sub_menu # goes one level deep
        elsif input.downcase == "exit" #exits program if user types 'exit'
            bye
        else
            invalid_option #if user inputs any other key, goes to this method
        end
    end

    def sub_menu #sub menu gives option to view more details of character
        puts ""
        puts "Type the character's number to view more details"
        puts ""
        puts "Type 'm' to go to main menu"
        puts "Type 'exit' to exit the program,"
        
        sub_menu_input
    end
    
    def sub_menu_input 
        input = gets.strip

        #this method takes the input, checks if it's between min of 1 and max of the
        #array length and outputs the details of the character in another method called
        #character details
        if input.to_i.between?(1, BreakingBad::Character.all.length) 
            character = BreakingBad::Character.all[input.to_i - 1]
            character_details(character)
            continue
        elsif input.downcase == "m"
            main_menu
        elsif input.downcase == 'exit'
            bye
        else
            invalid_option_2
            sub_menu
        end
    end

    def continue 
        puts "To select another character, type 'y'"
        puts "         To go to main menu, type 'm'"
        puts "        To quit the program, type 'exit'"
        input = gets.strip

        if input == "y"
            list_characters
            sub_menu
        elsif input == "m"
            main_menu
        elsif input == 'exit'
            bye
            sub_menu
        else
            invalid_option_2
            continue
        end 
    end

    def bye #this method exits the gem
        puts "Thanks for using this gem!"
        puts '         "Tread lightly." - Heisenberg '
        exit
    end

    def invalid_option #directs back to main menu after invalid user input
        puts ""
        puts "Looks like you typed the wrong key. Please try again!"
        
        main_menu
    end

    def invalid_option_2 #directs back to sub menu after invalid user input
        puts ""
        puts "Looks like you typed the wrong key. Please try again!"

        sub_menu
    end

    #iterates through .all characters array from character.rb file, and lists
    #the character's index number and name to the terminal
    def list_characters 
        puts ""
        BreakingBad::Character.all.each.with_index(1) do |character, i|
            puts "#{i}. #{character.name}"
        end
        puts ""
    end

    #calls all character instance methods that read and write their descriptions (from attr_accessor)
    def character_details(character)
        puts ""
        puts "      Name: #{character.name}"
        puts "  Nickname: #{character.nickname}"
        puts "Occupation: #{character.occupation}"
        puts "    Status: #{character.status}"
        puts " Portrayed: #{character.portrayed}"
        puts " Image URL: #{character.img}"
        puts ""
    end

end