# frozen_string_literal: true

class CreateSearchables < ActiveRecord::Migration[7.0]
  def change
    create_table :searchables do |t|
      t.string :search_term
      t.references :searchable_resource, polymorphic: true
    end
    add_index :searchables, :search_term, opclass: :gin_trgm_ops, using: :gin
  end
end
