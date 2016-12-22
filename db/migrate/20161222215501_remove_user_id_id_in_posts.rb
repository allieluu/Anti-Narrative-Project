class RenameUserIdIdInPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :user_id_id
  end
end
