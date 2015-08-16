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
		
	end
	
end