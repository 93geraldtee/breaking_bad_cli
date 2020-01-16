class CLI
    def start
        system('clear') #clears terminal

        puts "Welcome to the Breaking Bad API!"
        puts "Loading..."

        Character.new.all_characters

        binding.pry
        main_menu
    end

    def main_menu
        puts "option 1"
        puts "option 2"
        main_menu_input
    end

    def sub_menu
        puts "Type number associated with character to view more details"
    end

    def main_menu_input
        input = gets.strip

        if input == 1
            puts "something"
        elsif input == 2
            goodbye
        else
            invalid_option
            main_menu
        end
    end

    def goodbye
        puts "Thanks for using this gem!"
        exit
    end

    def invalid_option
        puts "Please try again."
    end

    def sub_menu_input
        input = gets.strip

        if input == 1
            puts "something"
        elsif input == 2
            goodbye
        else
            invalid_option
            main_menu
        end
    end

end