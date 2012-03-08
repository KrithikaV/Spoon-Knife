class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :firstname
      t.string :lastname
      t.string :phoneno
      t.string :email
      t.integer :cid

      t.timestamps
    end
  end
end
