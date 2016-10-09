require "./spec_helper"

sand = SandCrystal::Sand.new

describe SandCrystal do
  describe "#hi" do
    context "when not passed any parameter" do
      it "should print a static message" do
        sand.hi.should eq(SandCrystal::MESSAGE)
      end
    end
    context "when passed a string" do
      it "should print it" do
        sand.hi("asdf").should eq("asdf")
      end
    end
    context "when passed a number" do
      it "should print it in >>> and <<<" do
        sand.hi(5).should eq(">>> 5 <<<")
      end
    end
    context "when passed anything else (not a number and not a string)" do
      it "should print a static message" do
        sand.hi(nil).should eq(SandCrystal::MESSAGE) # nil param
        sand.hi({puts "hi"}).should eq(SandCrystal::MESSAGE) # block param
      end
    end
  end
end
