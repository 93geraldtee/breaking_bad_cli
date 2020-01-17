class BreakingBad::CLI
    def start
        system('clear') #clears terminal
        puts "Welcome to the Breaking Bad API!"
        BreakingBad::API.new.all_characters
        main_menu
    end

    def main_menu
        puts "Would you like to see all the characters?"
        puts "Type 'yes' to continue"
        puts "Type 'no' to quit the program"
        main_menu_input
    end

    def sub_menu
        puts "Type the character's number to view more details"
        puts "Type 'exit' to exit the program"
        sub_menu_input
    end

    def main_menu_input
        input = gets.strip

        if input.downcase == "yes"
            list_characters
            sub_menu
        elsif input.downcase == "no"
            bye
        else
            invalid_option
        end
    end

    def bye
        puts "Thanks for using this gem! Tread lightly. - Heisenberg"
        exit
    end

    def invalid_option
        puts "Please type the correct response."
        main_menu
    end

    def sub_menu_input
        input = gets.strip

        if input.to_i.between?(1, BreakingBad::Character.all.length)
            character = BreakingBad::Character.all[input.to_i - 1]
            character_details(character)
            continue
        elsif input.downcase == 'exit'
            bye
        else
            invalid_option
            sub_menu
        end
    end

    def list_characters
        BreakingBad::Character.all.each.with_index(1) do |character, i|
            puts "#{i}. #{character.name}"
        end
    end

    def character_details(character)
        puts "Name: #{character.name}"
        puts "Nickname: #{character.nickname}"
        puts "Occupation: #{character.occupation}"
        puts "Status: #{character.status}"
        puts "Portrayed: #{character.portrayed}"
        puts "Image URL: #{character.img}"
    end

    def continue
        puts "To select another character, type '1'"
        puts "To go to main menu, type '2'"
        puts "To quit the program, type 'exit'"
        input = gets.strip

        if input == "1"
            list_characters
        elsif input == "2"
            main_menu
        elsif input == 'exit'
            bye
            sub_menu
        else
            invalid_option
            continue
        end 
    end

end