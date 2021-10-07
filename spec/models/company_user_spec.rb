require 'rails_helper'

RSpec.describe CompanyUser, type: :model do
  it "is valid with a company_url,and phone_number" do
    user = User.new(
      name: "test",
      email: "test@test.com",
      password: "testtest",
      description: "test",
      )
    user.build_company_user(
      company_url: "test",
      phone_number: "00000000000",
      )
      expect(user).to be_valid
  end
  it "is invalid without a company_url" do
    user = CompanyUser.new(company_url: nil)
      user.valid?
      expect(user.errors[:company_url]).to include("を入力してください")
  end
  it "is invalid without a phone_number" do
    user = CompanyUser.new(phone_number: nil)
      user.valid?
      expect(user.errors[:phone_number]).to include("を入力してください", "は数値で入力してください", "は10文字以上で入力してください")
  end
  it "returns a user's  phone_number as a integer" do
    user = CompanyUser.new(phone_number: "test")
      user.valid?
      expect(user.errors[:phone_number]).to include("は数値で入力してください", "は10文字以上で入力してください")
  end
  it "returns a user's  phone_number as a too short" do
    user = CompanyUser.new(phone_number: "000")
      user.valid?
      expect(user.errors[:phone_number]).to include("は10文字以上で入力してください")
  end
  it "returns a user's  phone_number as a too long" do
    user = CompanyUser.new(phone_number: "000000000000")
      user.valid?
      expect(user.errors[:phone_number]).to include("は11文字以内で入力してください")
  end
end
