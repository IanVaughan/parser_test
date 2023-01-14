# frozen_string_literal: true

require './lib/presenters/ordered'
require './lib/parsers/visits'
require './lib/parsers/uniques'

class Parser
  include Parsers::Visits
  include Parsers::Uniques

  def initialize
    @data = Hash.new { |h, k| h[k] = Hash.new(0) }
  end

  def parse(line)
    return unless line.respond_to?(:split)

    url, ip_address = line.split
    return unless url.is_a?(String) && ip_address.is_a?(String)

    data[url][ip_address] += 1
  end

  private

  attr_reader :data
end
