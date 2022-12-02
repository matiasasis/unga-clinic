# frozen_string_literal: true

class CreateFaqs < ActiveRecord::Migration[7.0]
  def change
    create_table :faqs do |t|
      t.string :title
      t.string :answer
      t.boolean :show
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :faqs, :deleted_at
  end
end
