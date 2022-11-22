class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :age
      t.string :address

      t.timestamps
    end
  end
end
