class AddSlugToTreatments < ActiveRecord::Migration[7.0]
  def change
    add_column :treatments, :slug, :string
    add_index :treatments, :slug, unique: true

    add_index :treatments, :name, unique: true
    Treatment.find_each(&:save)
  end
end
