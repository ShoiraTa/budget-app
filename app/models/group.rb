class Group < ActiveRecord::Base
 belongs_to :user
 has_many :expenditures
 
 validates :name, presence: true

  def user_name(user_id)
    User.find( user_id).full_name
  end

end
