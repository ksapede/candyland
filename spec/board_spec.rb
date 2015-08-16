require 'spec_helper'

describe Board do 
	before :each do
		@board = Board.new
	end
	describe "#new" do
		it "returns a board" do
			expect(@board).to be_an_instance_of Board
		end
	end
	describe "#board" do 
		it "has 134 spaces" do 
			expect(@board.board.length).to eq(134)
		end
		it "is made of spaces" do 
			expect(@board.board[0]).to be_an_instance_of Space
		end
		it "starts with a red space" do 
			expect(@board.board[0].color).to eq("Red")
		end
		it "ends with an all space" do 
			expect(@board.board[-1].color).to eq("All")
		end
		
	end
	describe "#add" do 
		it "adds a space" do 
			@board.add(1)
			expect(@board.board[-1]).to be_an_instance_of Space
		end
		it "adds multiple spaces when passed a number greater than 1" do 
			@board.add(3)
			expect(@board.board.length).to eq(137)
		end
		it "adds one space when passed a 1" do 
			@board.add(1)
			expect(@board.board.length).to eq(135)
		end
		it "selects a color when you only pass a label" do
			@board.add(1,'','past the end')
			expect(@board.board[-1]).not_to eq('')
		end
		it "uses the right color when passed one" do 
			@board.add(1, 'Violet','invalid')
			expect(@board.board[-1].color).to eq('Violet')
		end
		it "ignore the color if not passed both a color and a label" do 
			@board.add(1,'White')
			expect(@board.board[-1].color).not_to eq('White')
		end
	end
	describe "#get_space_from_position" do 
		it "returns a space" do 
			space = @board.get_space_from_position(8) #plumpy
			expect(space).to be_an_instance_of Space
		end
		it "returns the correct space" do 
			space = @board.get_space_from_position(8) #plumpy
			expect(space.color).to eq('Pink')
		end
	end
	
end