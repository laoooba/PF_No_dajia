require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name, email, and password" do
    expect(FactoryBot.build(:user)).to be_valid
    end

  it "is invalid without a name" do
    user = FactoryBot.build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください", "は2文字以上で入力してください")
    end

  it "is invalid without an email address" do
    user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

  it "is invalid with a duplicate email address" do
    FactoryBot.create(:user, email: "aaron@example.com")
    user = FactoryBot.build(:user, email: "aaron@example.com")
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

  it "returns a user's  name as a string" do
    user = FactoryBot.build(:user, name: "test")
    expect(user.name).to eq "test"
  end
end
