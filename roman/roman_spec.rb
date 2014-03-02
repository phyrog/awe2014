require_relative 'roman'

describe RomanNumber do
  it "should return the string representation of the roman number 15" do
    no = RomanNumber.new(15)
    no.to_s.should == "XV"
  end

  it "should return the string representation of the roman number 4" do
    no = RomanNumber.new(4)
    no.to_s.should == "IV"
  end

  it "should return the string representation of the roman number 0" do
    no = RomanNumber.new(0)
    no.to_s.should == "N"
  end
end
