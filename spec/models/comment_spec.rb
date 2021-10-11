require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "is valid with a comment" do
    user = FactoryBot.create(:user)
    genre = FactoryBot.create(:genre)
    FactoryBot.create(:tag)
    post = FactoryBot.create(:post, genre: genre, user: user, tag_ids: 1)
     expect(FactoryBot.build(:comment,
     user: user,
     post: post,
     )
     ).to be_valid
    end
  it "is invalid without a comment" do
    comment = FactoryBot.build(:comment, comment: nil)
      comment.valid?
      expect(comment.errors[:comment]).to include("を入力してください")
    end
end