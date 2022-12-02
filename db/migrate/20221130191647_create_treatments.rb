# frozen_string_literal: true

class CreateTreatments < ActiveRecord::Migration[7.0]
  def change
    create_table :treatments do |t|
      t.string :name
      t.string :description
      t.string :place
      t.integer :price
      t.integer :downpayment
      t.references :professional, null: false, foreign_key: true
      t.integer :duration_min
      t.references :treatment_type, null: false, foreign_key: true
      t.string :room

      t.timestamps
    end
  end
end
