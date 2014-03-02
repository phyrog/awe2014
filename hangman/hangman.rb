#!/usr/bin/ruby


# Returns the given word only containing the given chars and underscores
def display_word(word, triedchars)
  res = ""
  word.split("").each do |char|
    if triedchars.include?(char.upcase) or not char.match(/^[[:alpha:]]$/)
      res += char
    elsif
      res += "_"
    end
  end
  res
end


# Returns the given string masked by the second string
# the number given in the mask describes the step the char is shown the first time
# characters that should be always shown may be masked with a whitespace
def mask_string(string, mask, step)
  s_chars = string.split ""
  m_chars = mask.split ""
  res = ""
  s_chars.zip(m_chars).each do |s_char, m_char|
    if m_char.to_i(16) <= step
      res += s_char
    else
      res += " "
    end
  end
  res
end

# Outputs the hangman ascii art for the given step
def display_hangman(step)
  puts mask_string "  ____  \n" +
                   " |/  |  \n" +
                   " |   O  \n" +
                   " |  /|\\ \n" +
                   " |  / \\ \n" +
                   "/|\\      ",
                   "  4444  \n" +
                   " 15  6  \n" +
                   " 1   7  \n" +
                   " 1  98a \n" +
                   " 1  b c \n" +
                   "213      ", step
end

# Retrieves a random word from the given file with a minimum length of 8 chars
def get_random_word(filename)
  dictFile = File.open filename
  words = dictFile.readlines.reduce([]) do |words, word|
    if word.strip!.length >= 8
      words << word
    end
    words
  end
  words[(rand words.length)]
end

if __FILE__ == $0
  file = ARGV[0] || "test.txt"

  word = get_random_word(file)

  triedChars = []
  solvedChars = word.split("").delete_if { |c| c.match(/^[[:alpha:]]$/)} # set special characters as solved from the beginning
  step = 0

  begin
    print "\e[H\e[2J"
    puts display_hangman step
    puts triedChars.sort.join ", "
    puts display_word(word, solvedChars)
    chars = $stdin.gets.strip.upcase.split ""
    # Allow multiple characters to be entered at the same time
    chars.each do |char|
      if display_word(word, solvedChars) != display_word(word, solvedChars + [char])
        solvedChars << char
      elsif not triedChars.include?(char) and not solvedChars.include?(char)
        triedChars << char
        step += 1
      end
    end
  end while display_word(word, solvedChars) != word and step < 12

  print "\e[H\e[2J"
  if display_word(word, solvedChars) == word and step < 12
    puts "  ____  \n" +
         " |/  |  \n" +
         " |  \\O/ \n" +
         " |   |  \n" +
         " |  / \\ \n" +
         "/|\\      "

    puts "Glückwunsch, das gesuchte Wort war: " + word
  else
    puts display_hangman 12
    puts "Das gesuchte Wort war: " + word
  end
end
#  ____
# |/  |
# |   O
# |  /|\
# |  / \
#/|\
