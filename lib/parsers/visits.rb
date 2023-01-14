# frozen_string_literal: true

module Parsers
  module Visits
    include Presenter::Ordered

    def visits
      data
        .transform_values { |v| v.values.sum }
        .then { ordered(_1, 'visits') }
    end
  end
end
