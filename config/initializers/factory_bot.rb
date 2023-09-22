# frozen_string_literal: true

Rails.application.configure do
  config.factory_bot.definition_file_paths = ['spec/factories']
  config.generators do |g|
    g.factory_bot dir: 'spec/factories'
  end
end
