# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Parser do
  let(:instance) { described_class.new }
  let(:line1) { '/help_page/1 126.318.035.038' }
  let(:line2) { '/contact 184.123.665.067' }

  describe '#parse' do
    subject { instance.parse(line1) }

    it 'parses a line' do
      is_expected.to eq 1
    end
  end

  describe '#visits' do
    subject { instance.visits }

    before do
      instance.parse(line1)
      instance.parse(line1)
      instance.parse(line2)
    end

    it 'returns visit counts' do
      is_expected.to eq('/help_page/1' => 2, '/contact' => 1)
    end
  end
end
