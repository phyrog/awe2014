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
    no.to_s.should == ""
  end

  it "should convert roman number to int" do
    RomanNumber.new(15).to_i.should == 15
  end
  
  it "should add two numbers" do
    x = RomanNumber.new(5)
    y = RomanNumber.new(23)
    (x + y).should == 28
  end

  it "should subtract two numbers" do
    x = RomanNumber.new(5)
    y = RomanNumber.new(23)
    (y - x).should == 18
  end

  it "should multiply two numbers" do
    x = RomanNumber.new(5)
    y = RomanNumber.new(23)
    (x * y).should == 115
  end

  it "should divide two numbers" do
    x = RomanNumber.new(5)
    y = RomanNumber.new(20)
    (y / x).should == 4
  end

  it "should check if two numbers are equal" do
    x = RomanNumber.new(5)
    y = RomanNumber.new(5)
    x.should == y
  end

  it "should check if two numbers are unequal" do
    x = RomanNumber.new(5)
    y = RomanNumber.new(23)
    x.should_not == y
  end

  it "should check if one number is bigger than the other" do
    x = RomanNumber.new(5)
    y = RomanNumber.new(23)
    y.should > x
  end

  it "should check if one number is smaller than the other" do
    x = RomanNumber.new(5)
    y = RomanNumber.new(23)
    x.should < y
  end

  it "should check if one number is bigger or equal than the other" do
    x = RomanNumber.new(5)
    y = RomanNumber.new(5)
    z = RomanNumber.new(6)
    x.should >= y
    z.should >= x
  end

  it "should check if one number is smaller or equal than the other" do
    x = RomanNumber.new(5)
    y = RomanNumber.new(5)
    z = RomanNumber.new(4)
    x.should <= y
    z.should <= x
  end
end
