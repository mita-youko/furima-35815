class RecordAddress
    include ActiveModel::Model
    attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :record_id, :user_id, :item_id

    with_options presence: true do
      validates :user_id
      validates :item_id
      validates :record_id
      validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
      validates :city
      validates :house_number
      validates :phone_number
    end
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :phone_number, numericality: true

    def save
        record = Record.create(user_id: user_id, item_id: item_id)
        Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, record_id: record.id)
    end
end