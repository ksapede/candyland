require_relative 'spec_helper'

describe Card do 
	before :all do
		@card1 = Card.new("Pink","Mr Mint",1)
		@card2 = Card.new("Orange","",1)
	end

	describe "#new" do
		it "creates a card" do
			expect(@card1).to be_an_instance_of Card
		end
		it "returns the correct color" do
			expect(@card1.color).to eq("Pink")
		end
		it "returns the correct label" do 
			expect(@card1.label).to eq("Mr Mint")
		end
		it "returns the right move repeat" do
			expect(@card1.move_count).to be(1)
		end
	end
	describe "#to_string" do
		it "returns the expected string for character cards" do
			expect(@card1.to_string).to eq("Mr Mint")
		end
		it "Returns the expected string for color cards" do
			expect(@card2.to_string).to eq("Single Orange")
		end
	end
end