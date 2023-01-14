# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Parser do # rubocop:disable Metrics/BlockLength
  let(:instance) { described_class.new }

  describe '#parse' do # rubocop:disable Metrics/BlockLength
    subject { instance.parse(line1) }

    context 'when line is valid' do
      let(:line1) { '/help_page/1 126.318.035.038' }

      it 'saves the line' do
        is_expected.to eq 1
      end
    end

    context 'when line is nil' do
      let(:line1) { nil }

      it 'skips the line' do
        is_expected.to eq nil
      end
    end

    context 'when line is empty' do
      let(:line1) { '' }

      it 'skips the line' do
        is_expected.to eq nil
      end
    end

    context 'when line is just a url' do
      let(:line1) { '/contact' }

      it 'skips the line' do
        is_expected.to eq nil
      end
    end

    context 'when line has extra data' do
      let(:line1) { '/contact 126.318.035.038 foo' }

      it 'saves the line' do
        is_expected.to eq 1
      end
    end
  end
end
