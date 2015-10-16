from random import shuffle
from card import Card

class Deck(object):
	
	def __init__(self):
		#super(Deck, self).__init__()
		#self.arg = arg
		self.deck = []
		self.discard = []

		self.build_deck()
		self.shuffle_deck()

	def build_deck(self):
		
		#do 6 times 1 2 3 4 5 6
		for i in range (1,6):	
			colors = ["Red","Purple","Yellow","Blue","Orange","Green"]
			for color in colors:
				self.deck.append(Card(color,'',1))
		
		for i in range (1,4):
			colors = ["Red","Purple","Yellow","Blue"]
			for color in colors:
				self.deck.append(Card(color,'',2))
		for i in range (1,3):
			colors =["Orange","Green"]
			for color in colors:
				self.deck.append(Card(color,'',2))

		self.deck.append(Card('Pink','Plumpy',1))
		self.deck.append(Card('Pink','Mr Mint',1))
		self.deck.append(Card('Pink','Jolly',1))
		self.deck.append(Card('Pink','Gramma Nutt',1))
		self.deck.append(Card('Pink','Princess Lolly',1))
		self.deck.append(Card('Pink','Queen Frostine',1))

	
	def shuffle_deck(self):	
		shuffle(self.deck)
		shuffle(self.deck)
		shuffle(self.deck)
		shuffle(self.deck)

	def reshuffle(self):
		self.deck = self.discard
		self.discard = []
		self.shuffle_deck()

	def draw_card(self):
		card_count = len(self.deck)
		print card_count

		if (card_count == 0):
			print "reshuffling"
			self.reshuffle()
		drawn_card = self.deck.pop()
		self.discard.append(drawn_card)
		return drawn_card

