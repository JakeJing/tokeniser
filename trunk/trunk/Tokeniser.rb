class Tokeniser
    def initialize(inputFileName,  outputFileName)
        @input = File.open(inputFileName,  "r")        
        @output = File.open(outputFileName,  "w") 
    end
    
    def splitSentences
        wordBefore = false
        sentences = 1
        while line = @input.gets
            line.strip.split(/[ |\n]/).each do |word|
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
        # Rules that reject a pair of word as a sentence seperator
        rules = [
                        [/[^.]$/,  //], 
                        [//, /\.$/], 
                        [/^[A-ZØÅÄÐÉÓÚÝÞÖa-zøåäðéóúýþö]\.$/u, //], 
                        [/^[A-ZØÅÄÁÐÉÍÓÚÝÞÖ][bcdfghj-np-tvxzøåäáðéíóúýþö]{0,4}\.$/u,  /^.{1,5}$/], 
                        [//,  /^[a-zøåäáðéíóúýþö]/u]
            ]
        words = [word, nextWord]
        rules.each do |rule|
            matched = [false,  false]
            [0, 1].each do |i|  
                if words[i] =~ rule[i]  or not words[i]
                    matched[i] = true
                end
            end
            if (matched[0] and matched[1] ) 
                return false
            end
        end
        return true
    end
    
    def close
        @input.close
        @output.close
    end    
end
