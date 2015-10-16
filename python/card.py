class Card(object):
	def __init__(self, color,label,move_count):
		#super(Card, self).__init__()
		self.color = color
		self.label = label
		self.move_count = move_count

	def to_string(self):
		if self.move_count == 1 and self.color != "Pink":
			return "Single %s" % self.color
		elif self.move_count == 2:
			return "Double %s" % self.color
		else:
			return "%s" % self.label


		