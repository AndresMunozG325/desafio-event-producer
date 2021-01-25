class Group < ApplicationRecord
    validates :name, presence: true
    validates :debut_date, presence: true
    validates :number_of_members, presence: true
    validates :type_of_band, presence: true
    
    enum type_of_band: [:Men, :Women, :Band]
end
