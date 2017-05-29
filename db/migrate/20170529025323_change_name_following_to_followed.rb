class ChangeNameFollowingToFollowed < ActiveRecord::Migration[5.0]
  def change
    rename_column :follows, :following_id, :followed_id
  end
end
