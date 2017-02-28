class Computer
    attr_reader :board 
    
    def computer_answer
        @random_number = 0
        @random_letter = ""
        @board = []
        4.times do
            @random_number = rand(4)
            translate_number_to_letter
            @board << @random_letter
        end
        p @board ###########
    end
    
    def get_possible_colors
        @possible_color = @board.uniq
        @possible_color.length
    end
    
    def print_instructions
        puts "oh, just google it already"
    end
    
    def translate_number_to_letter
       if @random_number == 0 
            @random_letter = 'Y'
        elsif @random_number == 1
            @random_letter = "R"
        elsif @random_number == 2
            @random_letter = "G"
        elsif @random_number == 3
            @random_letter = "B"
        else #catch all
            @random_letter = "Error"
        end
    end
    
end