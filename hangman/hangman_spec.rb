require_relative './hangman'

describe "Hangman" do
  it "returns given word containing given chars" do
    display_word("Halsband", ["A"]).should eq("_a___a__")
    display_word("Halsband", ["X"]).should eq("________")
  end
  
  it "returns given string and masked string" do
    mask_string("Halsband", "12345267", 1).should eq("H       ") 
    mask_string("Halsband", "12345267", 7).should eq("Halsband") 
  end
  
  it "ouputs hangman ascii art" do 
    display_hangman(1).should eq("        \n" +
                                 " |      \n" +
                                 " |      \n" +
                                 " |      \n" +
                                 " |      \n" +
                                 " |       ")
  end

  it "retrieves random word" do 
    get_random_word("test.txt").length.should >=8
  end

end
