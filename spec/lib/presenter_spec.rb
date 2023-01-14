# frozen_string_literal: true

require 'spec_helper'
# require './lib/presenter'

RSpec.describe Presenter do
  let(:dummy_class) { Class.new { include Presenter } }

  describe '.ordered' do
    let(:data) { { '/help_page/1' => 2, '/contact' => 1, '/foo' => 3 } }
    let(:label) { 'visits' }

    subject { dummy_class.new.ordered(data, label) }

    it 'presents the data in the correct order with the label' do
      is_expected.to eq ['/foo 3 visits', '/help_page/1 2 visits', '/contact 1 visits']
    end
  end
end
