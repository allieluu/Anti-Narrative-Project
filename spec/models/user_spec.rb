require 'rails_helper'

RSpec.describe User, :type => :model do
  subject {
    described_class.new(username: 'abcdefgh',
                        password: 'password',
                        email: 'janedoe@jane.com')
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a username' do
    subject.username = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid if username is too short' do
    subject.username = 'abc'
    expect(subject).to_not be_valid
  end

  it 'is not valid if username is too long' do
    subject.username = 'a' * 26
    expect(subject).to_not be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid if password is too short' do
    subject.password = 'pword'
    expect(subject).to_not be_valid
  end
end
