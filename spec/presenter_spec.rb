# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Presenter do
  let(:instance) { described_class.new }

  describe '#visits' do
    let(:data) { { '/help_page/1' => 2, '/contact' => 1, '/foo' => 3 } }

    subject { instance.visits(data) }

    it 'presents' do
      is_expected.to eq '/foo 3 visits\\n/help_page/1 2 visits\\n/contact 1 visits'
    end
  end

  describe '#unique' do
    let(:data) { { '/contact' => 2, '/help_page/1' => 1, '/foo' => 3 } }

    subject { instance.unique(data) }

    it 'presents' do
      is_expected.to eq '/foo 3 unique views\\n/contact 2 unique views\\n/help_page/1 1 unique views'
    end
  end
end
