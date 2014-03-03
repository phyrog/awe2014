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
    roman(@number)
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
