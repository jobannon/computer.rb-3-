class User
    attr_reader :color_combo,
                :end_game,
                :user_action
    
    def initialize
        @end_game = false
        @tries = 0
        @user_array = []
        @historical_user_array = []
        @user_action = :dumb
    end
    
    def setup
        while @user_action == :dumb
            puts "Would you like to (p)lay or have (i)nstructions?"
            @initial_user_question = gets.chomp
            
            if @initial_user_question == "p" || @initial_user_question == "P" || @initial_user_question == "play" ||  @initial_user_question == "Play"
                @user_action = :play
            elsif @initial_user_question == "i" || @initial_user_question == "I" || @initial_user_question == "instructions" || @initial_user_question == "Instructions"
                @user_action = :instruct
            else
                @user_action = :dumb
            end
        end
    end
    
    
    def return_user_action
        @user_action
    end
    
    def return_user_guess
        @user_guess
    end
    
    def get_input
        @valid_input = false # to get into loop
        
        while @valid_input == false
            puts "Please enter a guess (RGBY only)"
            @user_guess = gets.chomp
            if @user_guess.capitalize == "Q" 
                 @end_game = true
                 @valid_input = true
            else
                make_array_before_commit
                check_valid_input
            end
        end
        
       
    end
    
    def check_valid_input
        @valid_input_counter = 0
        @user_array_before.each do |user_letter|
            if user_letter == "Y" || user_letter == "R" || user_letter == "G" || user_letter == "B"
                #there is a better way to do this
            else
                 @valid_input_counter = @valid_input_counter + 1
            end
        end
        
        
        if @valid_input_counter == 0 
            @valid_input = true
        elsif @valid_input_counter > 0
            @valid_input = false
        end
        #check length
        if @user_array_before.length != 4
            @valid_input = false
        end
    end
    
    def print_board(computer)
        @print_counter = 0
        @historical_user_array.each do |response|
            @print_counter = @print_counter + 1
            if (@print_counter % 4) == 0 
                print response 
                print " "
                puts # there is a better way
            else
                print response
                print " "
            end
        end
        puts
    end
    
    def make_array_before_commit
          #take user input and put into array
        @user_array_before = @user_guess.split("")
        
        #capitalize
        @user_array_before = @user_array_before.map do |element|
            element.capitalize
        end
    end
    
    def make_array
        @user_array = @user_array_before
    end
    
    def how_many_tries
        @tries
    end
    
    def right_color_and_position(computer)
        @slot = 0
        @positional_count = 0
        4.times do 
            if @user_array[@slot] == computer.board[@slot]
                @positional_count = @positional_count + 1
            end
            @slot = @slot + 1 
        end
    end
    
    def right_color(computer)
        @slot = 0 
        @slot2 = 0
        @color_combo = []
       
       #loop thru arrays to find out how many color matches we have
       4.times do 
            4.times do
                if @user_array[@slot] == computer.board[@slot2]
                    @color_combo << @user_array[@slot]
                end
                @slot2 += 1
            end
            @slot2 = 0
            @slot += 1
           
        end
        
        #reduce our color matches to the four possible matches
        @color_combo = @color_combo.uniq!
    end
    
    def how_much_user_won(computer)
        @tries = @tries + 1
        if @positional_count == 4
            puts "Congratulations, you won in #{@tries} tries"
            @end_game = true
        else
            if color_combo.nil? == true
                puts "You have guessed 0 out of #{computer.get_possible_colors} colors correct"
                 puts "You have guessed #{@positional_count} out of #{computer.board.length} correct positions"
            else
                puts "You have guessed #{@color_combo.length} out of #{computer.get_possible_colors} colors correct"
                puts "You have guessed #{@positional_count} out of #{computer.board.length} correct positions"
            end
            puts "You have tried: #{@tries}"
        end
    end
    
    def append_user_response
        
        @user_array.each do |element|
            @historical_user_array << element
        end
        
    end
end