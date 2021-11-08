class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.string :title
      t.string :message
      t.binary :file
      t.date :date

      t.timestamps
    end
  end
end
