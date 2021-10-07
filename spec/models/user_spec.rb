require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name, email, and password" do
    user = User.new(
      name: "test",
      email: "test@test.com",
      password: "testtest",
      description: "test",
      )
      expect(user).to be_valid
    end
  it "is invalid without a name" do
    user = User.new(name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください", "は2文字以上で入力してください")
    end
  it "is invalid without an email address" do
    user = User.new(email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
  it "is invalid with a duplicate email address" do
    User.create(
      name: "test1",
      email: "test@test.com",
      password: "test123",
      description: "test",
      )
    user = User.new(
      name: "test2",
      email: "test@test.com",
      password: "test1234",
      description: "test",
      )
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end
  it "returns a user's  name as a string" do
    user = User.new(
      name: "test",
      email: "test@test",
      password: "test123",
      description: "test",
    )
    expect(user.name).to eq "test"
  end
end
