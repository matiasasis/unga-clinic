# frozen_string_literal: true

class AddDeletedAtToModels < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :deleted_at, :datetime
    add_index :users, :deleted_at
    add_column :professionals, :deleted_at, :datetime
    add_index :professionals, :deleted_at
  end
end
