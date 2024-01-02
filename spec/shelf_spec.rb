require 'rails_helper'

RSpec.describe Shelf, type: :model do
  subject { Shelf.new(description: 'First Row') }

  before { subject.save }

  it 'description should be present' do
    subject.description = nil
    expect(subject).to_not be_valid
  end
end
