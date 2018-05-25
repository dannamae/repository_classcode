class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :studentnum
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.string :sectionname
      t.string :password_digest
      t.timestamps
    end
  end
end
