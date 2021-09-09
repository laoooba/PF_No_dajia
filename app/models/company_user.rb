class CompanyUser < ApplicationRecord
  belongs_to :user, inverse_of: :company_user
  
  validates :phone_number, presence: true, numericality: {only_integer: true},length: { minimum: 10, maximum: 11 }
  validates :company_url, presence: true
  
end
