require 'rails_helper'

RSpec.describe Post, type: :model do
  subject {
    described_class.new(:title => 'New Post',
                        :content => 'This is a new post that I wrote for this test.')
  }

  it 'is not valid with no title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with no content' do
    subject.content = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid if title more than 255 characters' do
    subject.title = subject.title * 32
    expect(subject).to_not be_valid
  end

  it 'is not valid if title is an empty string' do
    subject.title = ''
    expect(subject).to_not be_valid
  end

  it 'is not valid if content is less than 10 characters' do
    subject.content = 'content'
    expect(subject).to_not be_valid
  end
end
