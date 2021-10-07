require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is valid with a title, body, tags, and genre" do
    user = User.new(
      name: "test",
      email: "test@test.com",
      password: "testtest",
      description: "test",
      )
    Genre.create(
      title: "taiwan",
      )
    Tag.create(
      title: "school",
      )
    Tag.create(
      title: "style",
      )
    post = user.posts.new(
      title: "hello",
      body: "world",
      tag_ids: 1,
      genre_id: 1,
      )
    expect(post).to be_valid
  end
  it "is invalid without a title" do
    post = Post.new(title: nil)
      post.valid?
      expect(post.errors[:title]).to include("を入力してください")
  end
  it "is invalid without a body" do
    post = Post.new(body: nil)
      post.valid?
      expect(post.errors[:body]).to include("を入力してください")
  end
  it "is invalid without a tag_ids" do
    post = Post.new(tag_ids: nil)
      post.valid?
      expect(post.errors[:tag_ids]).to include("を入力してください")
  end
  
end
