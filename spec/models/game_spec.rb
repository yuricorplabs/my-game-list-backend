# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Game do
  subject(:game) { build(:game) }

  it { expect(game).to belong_to(:publisher) }

  context 'when changes the name' do
    subject(:game) { create(:game) }

    before do
      game
    end

    it 'calls worker' do
      expect(IndexSearchJob).to receive(:perform_later)
      game.update(name: 'New')
    end
  end

  context 'when changes the year' do
    subject(:game) { create(:game) }

    before do
      game
    end

    it 'does not calls worker' do
      expect(IndexSearchJob).not_to receive(:perform_later)
      game.update(year: '1988')
    end
  end
end
