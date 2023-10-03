# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Publisher do
  subject(:publisher) { build(:publisher) }

  it { expect(publisher).to have_many(:games) }
end
