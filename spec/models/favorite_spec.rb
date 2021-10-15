require 'rails_helper'

RSpec.describe Favorite, type: :model do
  it "is valid with a favorites" do
    user = FactoryBot.build(:user)
    post = FactoryBot.build(:post)
    expect(FactoryBot.build(
      :favorite,
      post: post,
      user: user,
      )
      ).to be_valid
  end
end
