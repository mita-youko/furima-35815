class Item < ApplicationRecord
  belongs_to :user
  has_one :record
  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :ship_cost
  belongs_to :prefecture
  belongs_to :ship_date

  with_options presence: true do
    validates :name
    validates :description
    validates :price, inclusion: { in: 300..9_999_999, message: 'is out of setting range' }
    validates :image
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :condition_id
      validates :ship_date_id
      validates :ship_cost_id
      validates :prefecture_id
    end
  end
  validates :price, numericality: true
end
