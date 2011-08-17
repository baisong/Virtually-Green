class Review < ActiveRecord::Base
    belongs_to :product
    belongs_to :user
    validates_uniqueness_of :user_id, :scope => :product_id
end
