class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :job_title, :department, :company_name, :office_phone, :mobile_phone, :website_url, :email, :address_1, :address_2, :address_3, :address_4, :linkedin, :twitter, :github, :bonus_field
end
