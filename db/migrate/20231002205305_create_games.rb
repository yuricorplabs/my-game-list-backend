# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :year
      t.text :description
      t.references :publisher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
