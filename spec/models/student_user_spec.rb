require 'rails_helper'

RSpec.describe StudentUser, type: :model do
  it "is valid with a school_name,and major" do
    user = User.new(
      name: "test",
      email: "test@test.com",
      password: "testtest",
      description: "test",
      )
    user.build_student_user(
      school_name: "test",
      major: "test",
      )
      expect(user).to be_valid
  end
  it "is invalid without a school_name" do
    user = StudentUser.new(school_name: nil)
      user.valid?
      expect(user.errors[:school_name]).to include("を入力してください")
  end 
  it "is invalid without a major" do
    user = StudentUser.new(major: nil)
      user.valid?
      expect(user.errors[:major]).to include("を入力してください")
  end 
end
