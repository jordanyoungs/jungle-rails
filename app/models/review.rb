class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :product_id, presence: true
  validates :user_id, presence: true
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validate :cannot_review_same_product_twice

  def cannot_review_same_product_twice
    if Review.where(product_id: product_id, user_id: user_id).present?
      errors.add(:base, "Can't review the same product twice")
    end
  end
end
