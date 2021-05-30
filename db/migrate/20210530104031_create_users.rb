class CreateUsers < ActiveRecord::Migration[6.1]
  #table created with migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
    end
  end
end
