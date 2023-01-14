# frozen_string_literal: true

require 'spec_helper'

module Parsers
  RSpec.describe Uniques do
    let(:dummy_class) do
      Class.new do
        include Uniques

        def initialize(data)
          @data = data
        end

        attr_reader :data
      end
    end

    describe '#uniques' do
      subject { dummy_class.new(data).uniques }

      let(:data) do
        {
          '/url_1' => { 'ip_address_1' => 1 },
          '/url_2' => { 'ip_address_1' => 2, 'ip_address_2' => 3 }
        }
      end

      it 'returns a ordered formated list' do
        is_expected.to eq ["/url_2 2 unique views", "/url_1 1 unique views"]
      end
    end
  end
end
