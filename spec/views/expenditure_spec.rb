require 'rails_helper'

RSpec.describe 'Expenditure', type: :feature do
  describe 'Expenditure' do
    before(:each) do
      @user = User.create! password: '123456', email: 'user@email.com', full_name: 'User Name'
      @group = Group.create! name: 'group', user_id: @user.id, icon: 'Education'
      Expenditure.create! name: 'Expenditure', user_id: @user.id, amount: 20, group_id: @group.id
      Expenditure.create! name: 'new Expenditure', user_id: @user.id, amount: 20, group_id: @group.id

      visit '/users/sign_in'
      fill_in 'Email', with: 'user@email.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
    end

    scenario 'I can see an expenditure I added' do
      click_link 'group'
      expect(page).to have_content('Expenditure')
      expect(page).to have_content('20')
    end

    scenario 'I can see a total expenditure amount' do
      click_link 'group'
      expect(page).to have_content('new Expenditure')
      expect(page).to have_content('Total spent: $40')
    end

    scenario 'I can open a a page to add a new expenditure' do
      click_link 'group'
      click_link 'Add a new expenditure'
      expect(page).to have_content('NEW EXPENDITURE')
    end
  end
end
