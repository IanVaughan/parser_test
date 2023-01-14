#!/usr/bin/env ruby
# frozen_string_literal: true

# Usage: ./parser.rb webserver.log

require './lib/parser'
require './lib/presenter'

file_input = ARGV[0]

parser = Parser.new
File.foreach(file_input) { |line| parser.parse(line) }

puts 'Visits:'
puts Presenter.new(parser.visits).visits

puts
puts 'Unique:'
puts Presenter.new(parser.unique).unique
