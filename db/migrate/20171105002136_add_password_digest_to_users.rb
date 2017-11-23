class AddPasswordDigestToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :password_digest, :string
    add_column :users, :invoke, :string
    add_column :users, :active_record, :string
  end
end
