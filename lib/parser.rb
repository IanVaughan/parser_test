# frozen_string_literal: true

class Parser
  def initialize
    @visits = Hash.new(0)
    @unique = Hash.new { |h, k| h[k] = Hash.new(0) }
  end

  def parse(line)
    url, ip_address = line.split(' ')
    @visits[url] += 1
    @unique[url][ip_address] += 1
  end

  def unique
    @unique.transform_values(&:count)
  end

  attr_reader :visits
end
