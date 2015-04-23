CHOICES = {r: 'rock', p: 'paper', s: 'scissors'}

def design
  puts "***********************"
end

puts "What is your name player?"
user_name = gets.chomp.capitalize

begin
  design
  puts "#{user_name}! Choose rock, paper, or scissors to begin game."
  design
  player_input = gets.chomp

  computer_choice = CHOICES.values.sample

  if player_input == computer_choice
    puts "#{user_name} choose #{player_input} and Computer choose #{computer_choice}." 
    puts "Its a Tie!"
    design
  elsif player_input == 'rock' && computer_choice == 'scissors' || 
    player_input == 'paper' && computer_choice == 'rock' || 
    player_input == 'scissors' && computer_choice == 'paper'
    puts "#{user_name} choose #{player_input} and Computer choose #{computer_choice}."
    puts "Y O U   W I N  !  !  !"
    design
  else
    puts "#{user_name} choose #{player_input} and Computer choose #{computer_choice}"
    puts "Y O U   L O S E  !  !  !"
    design
  end
  puts "Play again (y/n)"
  done = gets.chomp
  system("clear")
end while done == "y"


