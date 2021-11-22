class AddQidToDiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :diaries, :qid, :integer
  end
end
