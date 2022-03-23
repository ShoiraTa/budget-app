class RemoveUsersFromGroups < ActiveRecord::Migration[7.0]
  def change
    remove_reference :groups, :users, null: false, foreign_key: true
  end
end
