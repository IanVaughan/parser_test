# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Presenter do
  let(:instance) { described_class.new(data) }

  describe '#visits' do
    let(:data) { { '/help_page/1' => 2, '/contact' => 1, '/foo' => 3 } }

    subject { instance.visits }

    it 'presents' do
      is_expected.to eq ['/foo 3 visits', '/help_page/1 2 visits', '/contact 1 visits']
    end
  end

  describe '#unique' do
    let(:data) { { '/contact' => 2, '/help_page/1' => 1, '/foo' => 3 } }

    subject { instance.unique }

    it 'presents' do
      is_expected.to eq ['/foo 3 unique views', '/contact 2 unique views', '/help_page/1 1 unique views']
    end
  end
end
