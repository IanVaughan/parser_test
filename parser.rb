#!/usr/bin/env ruby
# frozen_string_literal: true

# Usage: ./parser.rb webserver.log

require './lib/parser'

file_input = ARGV[0]

parser = Parser.new
File.foreach(file_input) { |line| parser.parse(line) }

puts 'Visits:'
puts parser.visits

puts
puts 'Unique:'
puts parser.uniques
