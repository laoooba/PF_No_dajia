require 'rails_helper'

RSpec.describe Admin, type: :model do
  it "is valid with a name, email, and password" do
    expect(FactoryBot.build(:admin)).to be_valid
    end
end
