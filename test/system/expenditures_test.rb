require 'application_system_test_case'

class ExpendituresTest < ApplicationSystemTestCase
  setup do
    @expenditure = expenditures(:one)
  end

  test 'visiting the index' do
    visit expenditures_url
    assert_selector 'h1', text: 'Expenditures'
  end

  test 'should create expenditure' do
    visit expenditures_url
    click_on 'New expenditure'

    fill_in 'Amount', with: @expenditure.amount
    fill_in 'Group', with: @expenditure.group_id
    fill_in 'Name', with: @expenditure.name
    fill_in 'User', with: @expenditure.user_id
    click_on 'Create Expenditure'

    assert_text 'Expenditure was successfully created'
    click_on 'Back'
  end

  test 'should update Expenditure' do
    visit expenditure_url(@expenditure)
    click_on 'Edit this expenditure', match: :first

    fill_in 'Amount', with: @expenditure.amount
    fill_in 'Group', with: @expenditure.group_id
    fill_in 'Name', with: @expenditure.name
    fill_in 'User', with: @expenditure.user_id
    click_on 'Update Expenditure'

    assert_text 'Expenditure was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Expenditure' do
    visit expenditure_url(@expenditure)
    click_on 'Destroy this expenditure', match: :first

    assert_text 'Expenditure was successfully destroyed'
  end
end
