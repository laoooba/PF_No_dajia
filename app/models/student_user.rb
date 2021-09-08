class StudentUser < ApplicationRecord
 belongs_to :user, inverse_of: :student_user
end
