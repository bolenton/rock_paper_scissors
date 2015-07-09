CHOICES = {r: 'rock', p: 'paper', s: 'scissors'}

def design
  puts "*********************************************"
end

design
puts "Welcome to Rock, Paper, Scissors game!"
puts "What is your name player?"
design
user_name = gets.chomp.capitalize

player_score = 0
computer_score = 0

begin
  design
  puts "#{user_name}! Choose rock(r), paper(p), or scissors(s) to begin game."
  design
  
  player_input = gets.downcase[0]
  computer_choice = CHOICES.values.sample

  if %w(p r s).include? player_input
    if player_input[0] == computer_choice[0]
      puts "#{user_name} choose #{player_input} and Computer choose #{computer_choice}." 
      puts "Its a Tie!"
      design
    elsif player_input[0] == 'rock'[0]     && computer_choice[0] == 'scissors'[0] || 
          player_input[0] == 'paper'[0]    && computer_choice[0] == 'rock'[0]     || 
          player_input[0] == 'scissors'[0] && computer_choice[0] == 'paper'[0]
      puts "#{user_name} choose #{player_input} and Computer choose #{computer_choice}."
      puts "Y O U   W I N  !  !  !"
      design
      player_score += 10
    else
      puts "#{user_name} choose #{player_input} and Computer choose #{computer_choice}"
      puts "Y O U   L O S E  !  !  !"
      design
      computer_score += 10
    end
  else 
    puts "Thats not a valid response."
  end
  puts "Play again (y/n)"
  done = gets.chomp.downcase
  system("clear")
  puts "#{user_name} has: #{player_score}"
  puts "Computer has : #{computer_score}"
end while done != "n"

system("clear")

puts "Thanks for playing 'Rock, Paper, Scissors'. Heres your final score:"
design
puts "#{user_name}: #{player_score}"
puts "Computer: #{computer_score}"
design
