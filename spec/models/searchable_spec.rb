# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Searchable do
  it 'is created after create a game' do
    expect { create(:game) }.to change(described_class, :count).by(2)
  end
end
