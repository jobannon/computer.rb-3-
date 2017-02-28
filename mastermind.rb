require_relative "./computer"
require_relative "./user"
require_relative "./help"
#init variable
# possible colors include yellw, red, green, blue

#initial interface
#(p)lay or (i)nstructions


#creates random number seqence
computer = Computer.new
computer.computer_answer

#set up the user instance
user = User.new

puts "Welcome to MasterMind"
#User directions or play
user.setup
if user.return_user_action == :instruct
    computer.print_instructions
end

#main game loop
while user.end_game == false
  
    user.get_input
    if user.return_user_guess == "Q" || user.return_user_guess == "q"
      puts "goodbye"
    else
      user.make_array
      
      #checks user input for right
      user.right_color_and_position(computer)
      user.right_color(computer) #checking color
      
      #output how much the user has won
      user.how_much_user_won(computer)
      user.end_game
      user.append_user_response
      
      user.print_board(computer)
      
    end
end


    

#loop

#questions from this exercise: 
#what is the difference between an instance variable and a regular variable
#enumerating within an enurermating thing each within an each
#mutlple or conditions in conditional
#what is this string literal stuff
#why did user action not return from reader_accessor