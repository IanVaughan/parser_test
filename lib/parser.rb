# frozen_string_literal: true

class Parser
  def initialize
    @visits = Hash.new(0)
  end

  def parse(line)
    url = line.split(' ').first
    @visits[url] += 1
  end

  private

  attr_reader :visits
end
