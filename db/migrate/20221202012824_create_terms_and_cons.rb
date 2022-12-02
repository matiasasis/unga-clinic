# frozen_string_literal: true

class CreateTermsAndCons < ActiveRecord::Migration[7.0]
  def change
    create_table :terms_and_cons do |t|
      t.text :text
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :terms_and_cons, :deleted_at
  end
end
