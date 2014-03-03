require_relative 'roman'

describe RomanNumber do

  it "should convert an integer to a roman number" do
    10.to_r.should == RomanNumber.new(10)
  end

  it "should return the string representation of the roman number 15" do
    no = 15.to_r
    no.to_s.should == "XV"
  end

  it "should return the string representation of the roman number 4" do
    no = 4.to_r
    no.to_s.should == "IV"
  end

  it "should return the string representation of the roman number 0" do
    no = 0.to_r
    no.to_s.should == ""
  end

  it "should convert roman number to int" do
    15.to_r.to_i.should == 15
  end
  
  it "should add two numbers" do
    x = 5.to_r
    y = 23.to_r
    (x + y).should == 28.to_r
  end

  it "should subtract two numbers" do
    x = 5.to_r
    y = 23.to_r
    (y - x).should == 18
  end

  it "should multiply two numbers" do
    x = 5.to_r
    y = 23.to_r
    (x * y).should == 115
  end

  it "should divide two numbers" do
    x = 5.to_r
    y = 20.to_r
    (y / x).should == 4
  end

  it "should check if two numbers are equal" do
    x = 5.to_r
    y = 5.to_r
    x.should == y
  end

  it "should check if two numbers are unequal" do
    x = 5.to_r
    y = 23.to_r
    x.should_not == y
  end

  it "should check if one number is bigger than the other" do
    x = 5.to_r
    y = 23.to_r
    y.should > x
  end

  it "should check if one number is smaller than the other" do
    x = 5.to_r
    y = 23.to_r
    x.should < y
  end

  it "should check if one number is bigger or equal than the other" do
    x = 5.to_r
    y = 5.to_r
    z = 6.to_r
    x.should >= y
    z.should >= x
  end

  it "should check if one number is smaller or equal than the other" do
    x = 5.to_r
    y = 5.to_r
    z = 4.to_r
    x.should <= y
    z.should <= x
  end
end
