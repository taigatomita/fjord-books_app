class ChangeNotnullToFollows < ActiveRecord::Migration[6.1]
  def change
    change_column_null :follows, :followee_id, false
    change_column_null :follows, :follower_id, false
  end
end
