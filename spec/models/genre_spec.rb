require 'rails_helper'

RSpec.describe Genre, type: :model do
  it "is valid with a title" do
    genre = Genre.new(
      title: "test",
      )
      expect(genre).to be_valid
    end
  it "is invalid without a title" do
    genre = Genre.new(title: nil)
      genre.valid?
      expect(genre.errors[:title]).to include("を入力してください")
    end
end
