class CompanyUser < ApplicationRecord
  belongs_to :user, inverse_of: :company_user
end
