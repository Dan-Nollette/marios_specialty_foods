class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.column :content_body, :string
      t.column :rating, :int 
      t.column :author, :string
      t.column :product_id, :int

      t.timestamps
    end
  end
end
