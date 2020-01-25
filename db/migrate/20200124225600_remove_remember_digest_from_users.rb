class RemoveRememberDigestFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :user, :remember_digest
  end
end
