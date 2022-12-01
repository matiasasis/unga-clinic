class AddDeletedAtToFaqs < ActiveRecord::Migration[7.0]
  def change
    add_column :faqs, :deleted_at, :datetime
    add_index :faqs, :deleted_at
  end
end
