class DropFriendrequests < ActiveRecord::Migration
  def change
    drop_table :friendrequests
  end
end
