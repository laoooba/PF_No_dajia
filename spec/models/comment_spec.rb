require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "is valid with a comment" do
    user = User.create(
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
    post = user.posts.create(
      title: "hello",
      body: "world",
      tag_ids: 1,
      genre_id: 1,
      )
    comment = Comment.new(
      comment: "test",
      user_id: user.id,
      post_id: post.id,
      )
    expect(comment).to be_valid
    end
  it "is invalid without a comment" do
    comment = Comment.new(comment: nil)
      comment.valid?
      expect(comment.errors[:comment]).toinclude("を入力してください")
    end
end