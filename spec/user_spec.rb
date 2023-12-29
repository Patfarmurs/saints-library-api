require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(username: 'Mukula', email: 'patrickkeita80@yahoo.com', password: 'Terushka') }

  before { subject.save }
  it 'username should be present' do
    subject.username = nil
    expect(subject).to_not be_valid
  end

  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'password should be present' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'username should not be too short' do
    subject.username = 'a'
    expect(subject).to_not be_valid
  end

  it 'username should not be too long' do
    subject.username = 'a' * 30
    expect(subject).to_not be_valid
  end
end
