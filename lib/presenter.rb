# frozen_string_literal: true

class Presenter
  def initialize(data)
    @data = data
  end

  def visits = sort('visits')
  def unique = sort('unique views')

  private

  attr_reader :data

  def sort(text)
    data
      .sort_by { |_a, b| b }
      .reverse
      .map { |k, v| "#{k} #{v} #{text}" }
  end
end
