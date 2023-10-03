# frozen_string_literal: true

class CreateSearchables < ActiveRecord::Migration[7.0]
  def change
    create_table :searchables do |t|
      t.string :search_term
      t.bigint :searchable_resource_id
      t.string :searchable_type
      t.timestamps
    end
    add_index :searchables, %i[searchable_type searchable_resource_id]
    add_index :searchables, :search_term, opclass: :gin_trgm_ops, using: :gin
  end
end
