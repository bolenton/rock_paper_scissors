class Hand
  CHOICES = {r: 'rock', p: 'paper', s: 'scissors'}
end

class Human
  attr_accessor :name, :player_score
  
  def initialize(name)
    @name = name
    @player_score = 0
  end

  def self.player_choice(player_name)
    puts "#{player_name.capitalize}! Choose one to begin the game: \n(r) rock \n(p) paper \n(s) scissors"
    puts " "
    gets.chomp
  end

  def self.get_name
    puts "What is your name?"
    name = gets.chomp
  end
end

class Computer
  attr_accessor :computer_score

  def initialize
    @computer_score = 0
  end

  def self.computer_choice
    Hand::CHOICES.values.sample
  end
end

class GamePlay

  def welcome
    puts "Welcome to Rock, Paper, Scissors game!"
    puts "If you can aquire 50 points befor I do, you win!"
  end

  def design
    puts "*********************************************"
  end

  def clear
    system("clear")
  end

  def self.show_choice(player_choice, computer_choice, player_name)
    puts "#{player_name} choose #{player_choice}"
    puts "Computer choose #{computer_choice}"
  end

  def self.compare(player_choice, computer_choice, design, player, computer)
    
    if %w(p r s).include? player_choice
      if player_choice[0] == computer_choice[0]
        puts "Its a Tie!"
        puts "Loading next round" 
        6.times do puts "..." 
          sleep(1)
        end
      elsif player_choice[0] == 'rock'[0]     && computer_choice[0] == 'scissors'[0] || 
        player_choice[0] == 'paper'[0]    && computer_choice[0] == 'rock'[0]     || 
        player_choice[0] == 'scissors'[0] && computer_choice[0] == 'paper'[0]
        puts "Y O U   W I N  !  !  !"
        puts "Loading next round"
        5.times do puts "..." 
          sleep(1)
        end
        player.player_score += 10
      else
        puts "Y O U   L O S E  !  !  !"
        puts "Loading next round"
        5.times do puts "..."
          sleep(1)  
        end
        computer.computer_score += 10
      end
    else 
      puts "Thats not a valid response."
      puts "Loading next round" 
      5.times do puts "..."
        sleep(1)  
      end 
    end
  end

  def run
    clear
    design
    welcome
    design
    player_name = Human.get_name
    player = Human.new(player_name)
    computer = Computer.new

    begin
      player_choice = Human.player_choice(player_name)
      computer_choice = Computer.computer_choice
      puts " "
      design
      GamePlay.show_choice(player_choice, computer_choice, player_name)
      GamePlay.compare(player_choice, computer_choice, design, player, computer)
      clear
      design
      puts "#{player_name} has: #{player.player_score}"
      puts "Computer has : #{computer.computer_score}"
      design
    end until player.player_score == 50 || computer.computer_score == 50
    
    clear
    if player.player_score == 50 
      puts "CONGRAT! YOU BEAT ME!"
    else
      puts "Sorry you lose. Better Luck next time."
    end
    puts "FINAL SCORE"
    design
    puts "#{player_name.capitalize}: #{player.player_score}"
    puts "Computer: #{computer.computer_score}"
    design
  end
end

rps = GamePlay.new.run
