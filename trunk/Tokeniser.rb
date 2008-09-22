class Tokeniser
    def initialize(inputFileName,  outputFileName)
        @input = File.open(inputFileName,  "r")
        @output = File.new(outputFileName,  "w")
    end
    
    def tokenise(pattern)
        while line = @input.gets
            line.split(pattern).each do |token|
                @output.puts token
            end
        end
    end        
    
    def close
        @input.close
        @output.close
    end
end
