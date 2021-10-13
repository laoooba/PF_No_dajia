require 'rails_helper'

RSpec.describe Contact, type: :model do
  it "is valid with a name title email body " do
    expect(FactoryBot.build(:contact)).to be_valid
    end
  it "is invalid without a name" do
    contact = FactoryBot.build(:contact, name: nil)
      contact.valid?
      expect(contact.errors[:name]).to include("を入力してください")
    end
  it "is invalid without a title" do
    contact = FactoryBot.build(:contact, title: nil)
      contact.valid?
      expect(contact.errors[:title]).to include("を入力してください")
    end
  it "is invalid without a email" do
    contact = FactoryBot.build(:contact, email: nil)
      contact.valid?
      expect(contact.errors[:email]).to include("を入力してください")
    end
  it "is invalid without a body" do
    contact = FactoryBot.build(:contact, body: nil)
      contact.valid?
      expect(contact.errors[:body]).to include("を入力してください")
    end
end