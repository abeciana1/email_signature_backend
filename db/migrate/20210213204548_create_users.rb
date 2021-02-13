class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :job_title
      t.string :department, :default => ""
      t.string :company_name, :default => ""
      t.string :office_phone, :default => ""
      t.string :mobile_phone, :default => ""
      t.string :website_url, :default => ""
      t.string :email
      t.string :address_1
      t.string :address_2
      t.string :address_3, :default => ""
      t.string :address_4, :default => ""
      t.string :linkedin, :default => ""
      t.string :twitter, :default => ""
      t.string :github, :default => ""
      t.string :bonus_field, :default => ""
      t.timestamps
    end
  end
end
