class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :content 
      t.integer :rating 
      t.integer :attraction_id 
      t.integer :user_id 


      t.timestamps
    end
  end
end
