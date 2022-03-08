class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validate :apparel_check

  def apparel_check
    if !mens_apparel && !womens_apparel
      errors.add :base, "They don't sell anything"
    end
  end
end
