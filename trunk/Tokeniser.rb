class Tokeniser
    def initialize(inputFileName,  outputFileName)
        @input = File.open(inputFileName,  "r")        
        @output = File.open(outputFileName,  "w") 
    end
    
    def splitSentences
        wordBefore = false
        sentences = 1
        while line = @input.gets
            line.strip.split(/ /).each do |word|
                word = word.strip
                if isEndOfSentence(wordBefore,  word) 
                    puts "#{wordBefore} #{word}"
                    word.insert(0,  "\r\n")                    
                    sentences += 1
                end
                @output.puts(word)
                wordBefore = word
            end
        end
        @output.puts
        return sentences
    end
    
    def isEndOfSentence(word ,  nextWord)
        rules = [/^[^.]*[.?!]$/,  /^[A-ZØÅÄÁÐÉÍÓÚÝÞÖ].*[^\.]$/]
        words = [word, nextWord]
        isEnd = true
        rules.each do |rule|
            [0, 1].each do |i|
                if not words[i] =~ rules[i] then isEnd = false end
            end
        end
        return isEnd
    end
    
    def close
        @input.close
        @output.close
    end    
end
