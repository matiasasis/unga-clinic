class AddShowToTreatment < ActiveRecord::Migration[7.0]
  def change
    add_column :treatments, :show, :boolean, default: false
  end
end
