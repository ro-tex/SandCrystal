require "./spec_helper"

sand = SandCrystal::Sand.new

describe SandCrystal do
  describe ".hi" do
    it "should print a message" do
      sand.hi.should eq("Hello!")
    end
    context "when passed a number" do
      it "should print it in >>> and <<<" do
        sand.hi(5).should eq(">>> 5 <<<")
      end
    end
  end
end
