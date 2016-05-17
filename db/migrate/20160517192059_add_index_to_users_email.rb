# Add an index on the email column of the users table.
# The index by itself doesn’t enforce uniqueness, but the option unique: true does.
# https://www.railstutorial.org/book/modeling_users#code-email_uniqueness_index
class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    add_index :users, :email, unique: true
  end
end
