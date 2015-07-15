
#Player
class Player
  attr_accessor :name, :player_score

  def initialize
    puts "What is your name?"
    @name = gets.chomp
    @player_score = 0
  end

  def player_hand
    puts "\nOk! First one to get 50pts wins"
    puts "\nChoose one: \n(r)rock \n(p)paper \n(s)scissiors."
    player_choice = gets.chomp
    puts "\nYou choose #{player_choice}"
    return player_choice
  end
end

#computer
class Computer
  attr_accessor :name, :computer_score

  CHOICES = {r: 'rock', p: 'paper', s: 'scissors'}
  
  def initialize(name)
    @name = name
    @computer_score = 0
  end

  def computer_hand
    computer_choice = CHOICES.values.sample
    puts "Computer choose #{computer_choice}"
    return computer_choice
  end
end

#GamePLay
class Game
  attr_accessor :player, :computer

  def initialize
    clear
    @player = Player.new
    @computer = Computer.new("Computer")
  end

  def design
    puts "*********************************************"
  end

  def clear
    system("clear")
    puts "*********************************************"
  end

  def compare_hand(player_hand, computer_hand)
    
    if %w(p r s).include? player_hand
      if player_hand[0] == computer_hand[0]
        puts "Its a Tie!"
      elsif player_hand[0] == 'rock'[0] && computer_hand[0] == 'scissors'[0] || 
            player_hand[0] == 'paper'[0]    && computer_hand[0] == 'rock'[0]     || 
            player_hand[0] == 'scissors'[0] && computer_hand[0] == 'paper'[0]
            puts "Y O U   W I N  !  !  !"
            player.player_score += 10
      else
        puts "Y O U   L O S E  !  !  !"
        computer.computer_score += 10
      end
    else 
      puts "Thats not a valid response."
    end
  end 

  def display_score
    puts "#{player.name.capitalize}: #{player.player_score}"
    puts "Computer: #{computer.computer_score}"
    puts "*********************************************"
  end

  def display_game_over
    clear
    if player.player_score == 50
      puts "Congratz! You beat me!"
    else
      puts "Aww, Good try, but I win!"
    end
    puts "Game Over! Here is the FInal Score"
    design
    puts "#{player.name.capitalize}: #{player.player_score}\nComputer: #{computer.computer_score}"
    design
  end

  def play
    round = 2
    begin
      clear
      display_score
      player_hand = player.player_hand
      computer_hand = computer.computer_hand
      compare_hand(player_hand, computer_hand)
      design
      puts "\nPrapare for round #{round}"
      
      3.times do 
        puts "..." 
        sleep(1)
      end

      round += 1
    end until player.player_score == 50 || computer.computer_score == 50

    display_game_over
  end
end

Game.new.play
