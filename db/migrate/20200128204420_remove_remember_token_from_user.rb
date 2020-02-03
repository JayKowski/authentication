class RemoveRememberTokenFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :remember_token
  end
end
