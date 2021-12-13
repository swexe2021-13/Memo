class RenameUidColumnToDiaries < ActiveRecord::Migration[5.2]
  def change
    rename_column :diaries, :uid, :user_id
  end
end
