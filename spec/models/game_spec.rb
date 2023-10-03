# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Game do
  subject(:game) { build(:game) }

  it { expect(game).to belong_to(:publisher) }
end
