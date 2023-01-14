# frozen_string_literal: true

class Parser
  def initialize
    @data = Hash.new { |h, k| h[k] = Hash.new(0) }
  end

  def parse(line)
    return unless line.respond_to?(:split)

    url, ip_address = line.split
    return unless url.is_a?(String) && ip_address.is_a?(String)

    data[url][ip_address] += 1
  end

  def visits = data.transform_values { |v| v.values.sum }
  def unique = data.transform_values(&:count)

  private

  attr_reader :data
end
