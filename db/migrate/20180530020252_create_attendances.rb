class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.string :date
      t.string :attendance
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
