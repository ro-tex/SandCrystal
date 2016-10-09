require "./spec_helper"

describe SandCrystal do
  describe ".hi" do
    it "should print a message" do
      SandCrystal.hi.should eq(nil)
    end
    context "when passed a number" do
      it "should print it in >>> and <<<" do
        SandCrystal.hi.should eq(nil)
      end
    end
  end
end
