class AddDefaultValuesToAddressFields < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :address_1, :string, :default => ""
    change_column :users, :address_2, :string, :default => ""
  end
end
