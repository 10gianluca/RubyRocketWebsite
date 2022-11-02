class Battery < ApplicationRecord
    # belongs_to :building, class_name: 'Building', foreign_key: 'building_id'
    # has_one :column, class_name: 'Column', foreign_key: 'battery_id'
    has_many :columns

    belongs_to :building
    belongs_to :employee
end
