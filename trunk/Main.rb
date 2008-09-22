#!/usr/bin/env ruby
load "Tokeniser.rb"

if ARGV.length != 2 then exit "Argument count should be 2" end

tokenise  = Tokeniser.new(ARGV[0],  ARGV[1])
results = tokenise.splitSentences
tokenise.close
    
puts "Found #{results[1]} sentences in #{results[0]} tokens."

