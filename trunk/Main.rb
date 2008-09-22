#!/usr/bin/env ruby
load "Tokeniser.rb"

if ARGV.length != 2 then exit "Argument count should be 2" end

tokenise  = Tokeniser.new(ARGV[0],  ARGV[1])
numSentences = tokenise.splitSentences
tokenise.close

puts "Found #{numSentences} sentences"

