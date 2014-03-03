class RomanNumber 
 
  @@Symbols = { 1=>'I', 5=>'V', 10=>'X', 50=>'L', 100=>'C', 500=>'D', 1000=>'N' }
  @@Subtractors = [ [1000, 100], [500, 100], [100, 10], [50, 10], [10, 1], [5, 1], [1, 0] ]

  def initialize(no)
    @number = no
  end

  private
  def roman(num)
    #Thanks to http://rosettacode.org/wiki/Roman_numerals/Encode#Ruby
    return @@Symbols[num] if @@Symbols.has_key?(num)
    @@Subtractors.each do |cutPoint, subtractor|
      return roman(cutPoint) + roman(num - cutPoint)      if num > cutPoint
      return roman(subtractor) + roman(num + subtractor)  if num >= cutPoint - subtractor and num < cutPoint
    end
    return ""
  end

  public
  def to_s
    roman(@number) if @number >= 0
  end

  def to_i
    @number
  end

  def +(no)
    RomanNumber.new (@number + no.to_i)
  end

  def -(no)
    RomanNumber.new (@number - no.to_i)
  end

  def *(no)
    RomanNumber.new (@number * no.to_i)
  end

  def /(no)
    RomanNumber.new (@number / no.to_i)
  end

  def ==(no)
    @number == no.to_i
  end

  def !=(no)
    not @number == no.to_i
  end

  def >(no)
    @number > no.to_i
  end

  def <(no)
    @number < no.to_i
  end

  def >=(no)
   self > no || self == no
  end

  def <=(no)
   self < no || self == no
  end
end

class Integer
  def to_r
    RomanNumber.new(self)
  end
end

class String
  private
  def fromRoman(roman)
    # Thanks to http://rosettacode.org/wiki/Roman_numerals/Decode#Ruby
    r = roman.upcase
    n = 0
    until r.empty? do
      case
      when r.start_with?('M')  then v = 1000; len = 1
      when r.start_with?('CM') then v = 900;  len = 2
      when r.start_with?('D')  then v = 500;  len = 1
      when r.start_with?('CD') then v = 400;  len = 2
      when r.start_with?('C')  then v = 100;  len = 1
      when r.start_with?('XC') then v = 90;   len = 2
      when r.start_with?('L')  then v = 50;   len = 1
      when r.start_with?('XL') then v = 40;   len = 2
      when r.start_with?('X')  then v = 10;   len = 1
      when r.start_with?('IX') then v = 9;    len = 2
      when r.start_with?('V')  then v = 5;    len = 1
      when r.start_with?('IV') then v = 4;    len = 2
      when r.start_with?('I')  then v = 1;    len = 1
      else
        raise ArgumentError.new("invalid roman numerals: " + roman)
      end
      n += v
      r.slice!(0,len)
    end
    n
  end
  
  public
  def to_r
    fromRoman(self).to_r
  end
end
