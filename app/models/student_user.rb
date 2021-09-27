class StudentUser < ApplicationRecord
  belongs_to :user, inverse_of: :student_user
  validates :school_name, :major, presence: true
end
