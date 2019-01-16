require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_length_of(:password) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:email) }

  it 'validates the format of email' do
    emails_expectations = [
      ['a@b.com', true],
      ['a@b', false],
      ['ab', false],
    ]

    password = '123456'

    emails_expectations.each do |email, expectation|
      expect(User.new(email: email, password: password).valid?).to eq(expectation)
    end
  end
end
