#from candyland import game
from candyland.game import Game

count = 10 #dummy value to emulate do-while loop

while count > 4:
	print "How many players?"
	count = int(raw_input())

mygame = Game(1)
mygame.play_game()
#mycard = Card("Red","",1)

#cardstring = mycard.to_string()
#print cardstring

