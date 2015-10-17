from player import Player
from board import Board
from deck import Deck
import random
 
class Game(object):
	def __init__(self,count):
		
		if count > 4:
			return 
		self.winner = "None"
		self.player_count = count
		self.players = []

		game_pieces = ["Red","Blue","Green","Yellow"]
		for i in range (0, self.player_count):
			print "adding player"
			self.players.append(Player(random.choice(game_pieces)))
		self.board = Board()
		self.card_deck = Deck()

	def play_game(self):
		rounds = 0
		while (self.winner == 'None'):
			rounds = rounds + 1
			self.play_round()
		print "%s wins after %s" %(self.winner,rounds)
		return rounds

	def play_round(self):
		
		for player in self.players:
			self.play_turn(player)
			if player.position >= self.board.board_length -1:
				self.winner = player.name
				break
			

	def play_turn(self,player):
		
		if player.stuck == 0:
			card = self.card_deck.draw_card()
			self.move_token(player,card)
			print_position = player.position + 1
			pretty_card = card.to_string()
			pretty_space = self.board.get_space_from_position(player.position).color
			print "%s drew %s and moved to space %d which is %s" %(player.name,pretty_card,player.position,pretty_space)
		else:
			print "%s is stuck! Skipping turn" % player.name
			player.stuck = 0

	def move_token(self,player,card):
		stuck = 0
		for a in range (0,card.move_count):
			if card.color == "Pink":
				next_space = 0
			else:
				next_space = player.position + 1
			current_position = player.position

			for i in range(next_space,self.board.board_length):
				space = self.board.get_space_from_position(i)
				#print "Trying %s %s for %s %s" %(space.color,space.label,card.color,card.label)
				if space.color == card.color or space.color == "All":
					if space.color == "Pink" and space.label == card.label:
						spaces = i
						current_position = i
						break
					elif space.label == "Rainbow Trail":
						current_position = i + 55
						break
					elif space.label == "Gumdrop Pass":
						current_position = i + 14
						break
					elif space.color != "Pink":
						current_position = i
						if space.label == "Sticky":
							stuck = 1
						break
			player.position = current_position
			player.stuck = stuck 



