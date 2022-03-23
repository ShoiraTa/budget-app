class Expenditure < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :name, presence: true
  validates :amount, presence: true

  def total_expenditures(group_id)
    total = 0
    Expenditure.where(group_id: group_id).each do |expenditure|
     total += expenditure.amount
    end
    total
  end
end
