require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(full_name: 'user', email: 'user@mail.com', password: '123456')
  end
  before { subject.save }

  it 'name should not be nil' do
    subject.full_name = nil
    expect(subject).to_not be_valid
  end

  it 'full_name should not be empty' do
    subject.full_name = ''
    expect(subject).to_not be_valid
  end

  it 'should valid the full_name' do
    subject.full_name = 'user'
    expect(subject).to be_valid
  end
end
