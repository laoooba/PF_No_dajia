require 'rails_helper'

RSpec.describe StudentUser, type: :model do
  it "is valid with a school_name,and major" do
    user = FactoryBot.build(:user)
    user.build_student_user(
      school_name: "test",
      major: "test",
      )
      expect(user).to be_valid
  end
  it "is invalid without a school_name" do
    user = FactoryBot.build(:student_user, school_name: nil)
      user.valid?
      expect(user.errors[:school_name]).to include("を入力してください")
  end
  it "is invalid without a major" do
    user = FactoryBot.build(:student_user, major: nil)
      user.valid?
      expect(user.errors[:major]).to include("を入力してください")
  end
end
