class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :realname, :string
    add_column :users, :email, :string
    add_column :users, :irc_nick, :string
  end
end
