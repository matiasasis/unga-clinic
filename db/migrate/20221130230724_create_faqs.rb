# frozen_string_literal: true

class CreateFaqs < ActiveRecord::Migration[7.0]
  def change
    create_table :faqs do |t|
      t.string :title
      t.string :answer
      t.boolean :show

      t.timestamps
    end
  end
end
