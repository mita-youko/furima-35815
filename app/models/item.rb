class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :ship_cost
  belongs_to :prefecture
  belongs_to :ship_date

  with_options presence: true do
    validates :category_id
    validates :condition_id
    validates :ship_cost_id
    validates :prefecture
    validates :ship_date_id
  end

end
