# frozen_string_literal: true

module Presenter
  def ordered(data, label)
    data
      .sort_by { |_a, b| b }
      .reverse
      .map { |k, v| "#{k} #{v} #{label}" }
  end
end
