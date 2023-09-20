# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Roots' do
  describe 'GET /index' do
    let(:parsed_response) { response.parsed_body }

    before do
      get root_path
    end

   
  end
end
