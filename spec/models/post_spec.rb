require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is valid with a title, body, tags, and genre" do
    user = FactoryBot.build(:user)
    genre = FactoryBot.create(:genre)
    FactoryBot.create(:tag)
    expect(FactoryBot.build(
      :post,
      genre: genre,
      user: user,
      tag_ids: 1
      )
      ).to be_valid
  end
  it "is invalid without a title" do
    post = FactoryBot.build(:post, title: nil)
      post.valid?
      expect(post.errors[:title]).to include("を入力してください")
  end
  it "is invalid without a body" do
    post = FactoryBot.build(:post, body: nil)
      post.valid?
      expect(post.errors[:body]).to include("を入力してください")
  end
  it "is invalid without a tag_ids" do
    post = FactoryBot.build(:post, tag_ids: nil)
      post.valid?
      expect(post.errors[:tag_ids]).to include("を入力してください")
  end
  it "returns a user's  title as a too short" do
    post = FactoryBot.build(:post, title: "aaaaaaaaaabbbbbbbbbbccccccccccd")
      post.valid?
      expect(post.errors[:title]).to include("は30文字以内で入力してください")
  end
end
