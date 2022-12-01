class CreateSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :settings do |t|
      t.string :terms_and_cons

      t.timestamps
    end
  end
end
