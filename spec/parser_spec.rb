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

  describe '#visits' do
    subject { instance.visits }

    let(:line1) { '/help_page/1 126.318.035.038' }
    let(:line2) { '/contact 184.123.665.067' }

    before do
      instance.parse(line1)
      instance.parse(line1)
      instance.parse(line2)
    end

    it 'returns visit counts' do
      is_expected.to eq({ '/help_page/1' => 2, '/contact' => 1 })
    end
  end

  describe '#unique' do
    subject { instance.unique }

    let(:line1) { '/help_page/1 126.318.035.038' }
    let(:line2) { '/contact 184.123.665.067' }
    let(:line3) { '/contact 126.318.035.038' }

    before do
      instance.parse(line1)
      instance.parse(line2)
      instance.parse(line3)
    end

    it 'returns unique counts' do
      is_expected.to eq({ '/contact' => 2, '/help_page/1' => 1 })
    end
  end
end
