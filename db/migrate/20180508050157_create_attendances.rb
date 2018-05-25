class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|

      t.string :date
      t.string :time
      t.string :studentnum 
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.string :attendance

      t.timestamps
    end
  end
end
