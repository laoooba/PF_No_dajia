require 'rails_helper'

RSpec.describe Tag, type: :model do
  it "is valid with a title" do
    expect(FactoryBot.build(:tag)).to be_valid
    end

  it "is invalid without a title" do
    tag = FactoryBot.build(:tag, title: nil)
      tag.valid?
      expect(tag.errors[:title]).to include("を入力してください")
    end
end
