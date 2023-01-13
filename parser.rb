#!/usr/bin/env ruby
# frozen_string_literal: true

file_input = ARGV[0]

File.foreach(file_input) do |line|
  puts line
end

