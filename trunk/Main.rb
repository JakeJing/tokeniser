load "Tokeniser.rb"

tokenise  = Tokeniser.new("../visindavefur.txt",  "output.txt")
tokenise.tokenise(/ /)
tokenise.close
