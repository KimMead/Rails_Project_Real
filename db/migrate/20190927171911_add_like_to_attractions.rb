class AddLikeToAttractions < ActiveRecord::Migration[5.2]
  def change
    add_column :attractions, :like, :integer
  end
end
