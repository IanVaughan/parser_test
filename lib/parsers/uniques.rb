# frozen_string_literal: true

module Parsers
  module Uniques
    include Presenter

    def uniques
      data
        .transform_values(&:count)
        .then { ordered(_1, 'unique views') }
    end
  end
end
