class ChangeSessionTokenNotNull < ActiveRecord::Migration[5.1]
  def change
    change_column_null :users, :session_token, false
  end
end
