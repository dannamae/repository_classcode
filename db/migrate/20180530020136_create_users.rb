class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :studentnum
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.timestamps
    end
  end
end
