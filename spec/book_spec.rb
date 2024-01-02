require 'rails_helper'

RSpec.describe Book, type: :model do
  subject { Book.new(title: 'Pearl of Great Price', author: 'Joseph Smith', body: 'Scriptures') }

  before { subject.save }
  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'author should be present' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'body should be present' do
    subject.body = nil
    expect(subject).to_not be_valid
  end
end
