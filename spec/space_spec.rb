require_relative 'spec_helper'

describe Space do 
	before :all do
		@space1 = Space.new("Blue")
		@space2 = Space.new("Orange","Sticky")
	end
	describe "#new" do
		it "returns a space object" do
			expect(@space1).to be_an_instance_of Space
		end
		it "sets the right color when passed only a color" do
			expect(@space1.color).to eq("Blue")
		end
		it "sets the right color when passed a color and label" do 
			expect(@space2.color).to eq("Orange")
		end
		it "sets a blank label if passed nothing" do
			expect(@space1.label).to eq("")
		end
		it "sets the passed label" do
			expect(@space2.label).to eq("Sticky")
		end
	end
end