# frozen_string_literal: true

class CreateTreatmentTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :treatment_types do |t|
      t.string :name
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :treatment_types, :deleted_at
  end
end
