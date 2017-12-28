class ModifySessionToken < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :session_token, :string
    add_index :users, :session_token, unique: true
  end
end
