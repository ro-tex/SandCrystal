require "./spec_helper"

describe Fizzbuzz do
  it "shouldn't divide 1 by 3" do
    Fizzbuzz.div_by_three(1).should eq(false)
  end
  it "should divide 3 by 3" do
    Fizzbuzz.div_by_three(3).should eq(true)
  end
  it "should divide 3 by 5" do
    Fizzbuzz.div_by_five(3).should eq(false)
  end
  it "should divide 15 by 5" do
    Fizzbuzz.div_by_five(15).should eq(true)
  end
  it "should divide 3 by 15" do
    Fizzbuzz.div_by_fifteen(3).should eq(false)
  end
  it "should divide 30 by 15" do
    Fizzbuzz.div_by_fifteen(30).should eq(true)
  end
end
