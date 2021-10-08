require 'rails_helper'

RSpec.describe Tag, type: :model do
  it "is valid with a title" do
    tag = Tag.new(
      title: "test",
      )
      expect(tag).to be_valid
    end
  it "is invalid without a title" do
    tag = Tag.new(title: nil)
      tag.valid?
      expect(tag.errors[:title]).to include("を入力してください")
    end
end
