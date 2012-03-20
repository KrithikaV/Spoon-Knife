class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
	t.string	:first_name ,   :limit => 50
      	t.string      	:last_name,     :limit => 50
	t.integer 	:phone_no,	:limit => 50
	t.string      	:email,		:limit => 50
        t.integer	:company_id,	:limit => 10
      t.timestamps
    end
  end
end
