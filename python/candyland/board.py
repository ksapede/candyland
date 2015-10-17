class Board(object):
	
	def __init__(self):
		self.color_index = 0
		self.build()

	def build(self):
		self.board = []
		self.board_length = 0
		self.color_index = 0
		self.add(4,'','')
		self.add(1,"","Rainbow Trail")
		self.add(3,'','')
		self.add(1,"Pink","Plumpy")
		self.add(8,'','')
		self.add(1,"Pink","Mr Mint")
		self.add(15,'','')
		self.add(1,"","Gumdrop Pass")
		self.add(8,'','')
		self.add(1,"Pink","Jolly")
		self.add(4,'','')
		self.add(1,"","Sticky")
		self.add(26,'','')
		self.add(1,"Pink","Gramma Nutt")
		self.add(10,'','')
		self.add(1,'',"Sticky")
		self.add(9,'','') #95 spaces
		self.add(1,"Pink","Princess Lolly")
		self.add(7,'','')
		self.add(1,'Pink','Queen Frostine')
		self.add(16,'','')
		self.add(1,'','Sticky')
		self.add(12,'','')
		self.add(1,'All','End')


	def add(self,space_count,color,label):
		colors = ["Red","Purple","Yellow","Blue","Orange","Green"]
		start_color = self.color_index  
		for i in range (0,space_count):
			n = (i + start_color -1) % 6
			if ( color and  label):
				space = Space(color,label)
				self.board.append(space)
			else:
				space = Space(colors[n],label)
				self.board.append(space)

			#print "space %s is %s %s" % (self.board_length,space.color,space.label)
			self.color_index = n
			self.board_length = self.board_length + 1


	def get_space_from_position(self,position):
		return self.board[position]


class Space(object):
	
	def __init__(self, color,label):
		#super(Space, self).__init__()
		self.color = color
		self.label = label
	