require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :name => 'lu', :titleize => "Chef lu the Great Baker") }
  subject(:dessert) { Dessert.new('brownie', 50, chef) }
  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq('brownie')
    end
    it "sets a quantity" do
      expect(dessert.quantity).to equal(50)
    end
    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end
    it "raises an argument error when given a non-integer quantity" do
      expect{ Dessert.new('brownie', '50', chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    before(:each) {
      dessert.add_ingredient('apple')
      dessert.add_ingredient('orange')
    }

    it "adds an ingredient to the ingredients array" do
      expect(dessert.ingredients).not_to be_empty
    end


  end

  describe "#mix!" do
    before(:each) {
      dessert.add_ingredient('apple')
      dessert.add_ingredient('orange')
      dessert.add_ingredient('stawberry')
    }
    it "shuffles the ingredient array" do
      ingredient_arr = Array.new(dessert.ingredients)
      result = dessert.mix!
      expect(result).not_to eq(ingredient_arr)
      #to make sure the array has original elements, nothng missing
      expect(result.sort).to eq(ingredient_arr.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(dessert.eat(5)).to eq(45)
    end


    it "raises an error if the amount is greater than the quantity" do
      expect{dessert.eat(55)}.to raise_error "not enough left!"
    end

  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      # allow(chef).to receive(:titleize)
      expect(dessert.serve).to include("Chef lu the Great Baker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).with(dessert)
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
