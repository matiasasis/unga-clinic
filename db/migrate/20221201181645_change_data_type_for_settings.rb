class ChangeDataTypeForSettings < ActiveRecord::Migration[7.0]
  def change
    change_column :settings, :terms_and_cons, :text
  end
end
