from random import choice
import os

def clear():
    os.system('clear')
 
choices = ['rock', 'paper', 'scissors']
 
def design():
	print('*********************************')
 
def winning_message(player_choice, computer_choice):
	player_score = 0
	print("Player choose %s"%(player_choice))
	print("Computer choose %s"%(computer_choice))
	print('you win')
	design()
	player_score += 10
	return player_score
 
computer_score = 0
player_score = 0
play_again = 'y'
 
while play_again == 'y':
 
	design()
	print("choose rock(r), paper(p) or scissors(s) to begin.")
	design()
	player_choice = raw_input(">>> ").lower()
	computer_choice = choice(choices)	
	design()
	
	if player_choice[0] == computer_choice[0]:
		print("Player choose %s"%(player_choice))
		print("Computer choose %s"%(computer_choice))
		print('its a tie!')
		design()
	elif player_choice[0] == 'r' and computer_choice[0] == 's':
		player_score += winning_message(player_choice, computer_choice)
	elif player_choice[0] == 'p' and computer_choice[0] == 'r':
		player_score += winning_message(player_choice, computer_choice)
	elif player_choice[0] == 's' and computer_choice[0] == 'p':
		player_score += winning_message(player_choice, computer_choice)
	else:
		print("Player choose %s"%(player_choice))
		print("Computer choose %s"%(computer_choice))
		print('you lose')
		design()
		computer_score += 10
		
	print('Play Again? [y/n]')
	play_again = raw_input('>>>').lower()
	clear()
	print("Player: %s"%(player_score))
	print("Computer: %s"%(computer_score))
 



