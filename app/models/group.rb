class Group < ActiveRecord::Base
  belongs_to :user
  has_many :expenditures

  validates :name, presence: true

  def user_name(user_id)
    User.find(user_id).full_name
  end

  def total_spent(id)
    expenditures = Expenditure.where(group_id: id)
    total = 0
    expenditures.each do |expenditure|
      total += expenditure.amount
    end
    total
  end
end
