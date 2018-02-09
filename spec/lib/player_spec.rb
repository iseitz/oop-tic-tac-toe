require 'spec_helper'
require_relative '../../lib/player'

describe Player do
  it 'has a x character' do
    player = Player.new('x')
    expect(player.character).to eq('x')
  end

  it 'has an o character' do
    player = Player.new('o')
    expect(player.character).to eq('o')
  end

end
