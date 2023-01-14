# frozen_string_literal: true

class Parser
  def initialize
    @data = Hash.new { |h, k| h[k] = Hash.new(0) }
  end

  def parse(line)
    url, ip_address = line.split
    data[url][ip_address] += 1
  end

  def visits
    data.transform_values { |v| v.values.sum }
  end

  def unique
    data.transform_values(&:count)
  end

  private

  attr_reader :data
end
