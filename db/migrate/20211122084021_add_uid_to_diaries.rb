class AddUidToDiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :diaries, :uid, :integer
  end
end
