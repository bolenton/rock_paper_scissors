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
    puts "#{player_name.capitalize}! Choose rock(r), paper(p), or scissors(s) to begin game."
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
  end

  def design
    puts "*********************************************"
  end

  def clear
    system("clear")
  end

  def self.show_choice(computer_choice, player_choice)
    puts "computer choose #{computer_choice}"
    puts "player choose #{player_choice}"
  end

  def self.compare(player_choice, computer_choice, design, player, computer)
    
    if %w(p r s).include? player_choice
      if player_choice[0] == computer_choice[0]
        puts "Its a Tie!"
        design
      elsif player_choice[0] == 'rock'[0]     && computer_choice[0] == 'scissors'[0] || 
        player_choice[0] == 'paper'[0]    && computer_choice[0] == 'rock'[0]     || 
        player_choice[0] == 'scissors'[0] && computer_choice[0] == 'paper'[0]
        puts "Y O U   W I N  !  !  !"
        design
        player.player_score += 10
      else
        puts "Y O U   L O S E  !  !  !"
        design
        computer.computer_score += 10
      end
    else 
      puts "Thats not a valid response."
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
      design
      GamePlay.show_choice(player_choice, computer_choice)
      GamePlay.compare(player_choice, computer_choice, design, player, computer)
      puts "Play again (y/n)"
      done = gets.chomp.downcase
      clear
      puts "#{player_name} has: #{player.player_score}"
      puts "Computer has : #{computer.computer_score}"
    end while done != "n"
    clear
    puts "FINAL SCORE"
    design
    puts "#{player_name.capitalize}: #{player.player_score}"
    puts "Computer: #{computer.computer_score}"
    design
  end
end

rps = GamePlay.new.run

