class ChangePasswordToPasswordDigest < ActiveRecord::Migration
  def change
    remove_column :users, :password
    add_column :users, :password_digest, :text
  end
end
