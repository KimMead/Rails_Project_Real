class AddOathTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :oauth_token, :string
  end
end
