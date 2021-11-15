class RenameColumnsToFollows < ActiveRecord::Migration[6.1]
  def change
    rename_column :follows, :user_id, :followee_id
    rename_column :follows, :follow_id, :follower_id
  end
end
