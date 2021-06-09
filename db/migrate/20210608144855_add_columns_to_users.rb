class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_timestamps :users, null: false, default: -> { "NOW()" }
  end
end
