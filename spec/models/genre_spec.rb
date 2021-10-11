require 'rails_helper'

RSpec.describe Genre, type: :model do
  it "is valid with a title" do
    expect(FactoryBot.build(:genre)).to be_valid
    end

  it "is invalid without a title" do
    genre = FactoryBot.build(:genre, title: nil)
      genre.valid?
      expect(genre.errors[:title]).to include("を入力してください")
    end
end