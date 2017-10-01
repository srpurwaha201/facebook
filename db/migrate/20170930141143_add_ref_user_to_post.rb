class AddRefUserToPost < ActiveRecord::Migration
  def change
    add_reference :posts, :ref_user, index: true, foreign_key: true
  end
end
