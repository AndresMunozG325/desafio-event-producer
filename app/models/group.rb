class Group < ApplicationRecord
    validates :name, presence: true
    validates :debut_date, presence: true
    validates :number_of_members, presence: true
    validates :type, presence: true
    
    enum type: [:Men, :Women, :Band]
end
