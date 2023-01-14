# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Usage' do
  let(:file_input) { 'webserver.log' }

  it 'works' do
    parser = Parser.new
    File.foreach(file_input) { |line| parser.parse(line) }

    expect(Presenter.new(parser.visits).visits).to eq(
      [
        '/about/2 90 visits',
        '/contact 89 visits',
        '/index 82 visits',
        '/about 81 visits',
        '/help_page/1 80 visits',
        '/home 78 visits'
      ]
    )

    expect(Presenter.new(parser.unique).unique).to eq(
      [
        '/index 23 unique views',
        '/home 23 unique views',
        '/contact 23 unique views',
        '/help_page/1 23 unique views',
        '/about/2 22 unique views',
        '/about 21 unique views'
      ]
    )
  end
end
