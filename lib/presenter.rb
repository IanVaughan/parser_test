# frozen_string_literal: true

class Presenter
  def visits(data)
    data.sort_by { |_a, b| b }.reverse.map { |k, v| "#{k} #{v} visits" }.join('\n')
  end
end
