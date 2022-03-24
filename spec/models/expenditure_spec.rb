require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(id: 1, full_name: 'user', email: 'user@mail.com', password: '123456') }
  let(:group) { Group.create(id: 2, name: 'Shopping', icon: 'Shopping', user_id: user.id) }
  let(:expenditure) { Expenditure.create(id: 1, name: 'Dress', amount: 12, user_id: user.id, group_id: group.id) }

  describe 'Expenditure validations' do
    context 'when valid' do
      it { expect(expenditure).to be_valid }
    end

    it 'Without name it is invalid ' do
      expenditure.name = nil
      expect(expenditure).to_not be_valid
    end
  end
end
