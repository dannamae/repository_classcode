class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :studentnum
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.string :sectionname
      t.string :password

      t.timestamps
    end
  end
end
