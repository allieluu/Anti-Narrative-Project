class ChangeUserIdTypeInPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :user_id, index: true
  end
end
