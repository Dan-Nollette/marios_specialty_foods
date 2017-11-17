class Review < ActiveRecord::Base
  belongs_to :product
  validates(:content_body, {:presence => true, :length => { :maximum => 250,  :minimum => 50}})
  validates :rating, :presence => true
  validates :author, :presence => true
  validates :product_id, :presence => true
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5],
    message: "rating must be 1, 2, 3, 4, or 5." }
end
