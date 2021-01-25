class Group < ApplicationRecord
    has_many :concerts, dependent: :destroy
    validates :name, presence: true
    validates :debut_date, presence: true
    validates :number_of_members, presence: true
    validates :type_of_band, presence: true
    
    enum type_of_band: [:Men, :Women, :Band]

    def number_of_concert
        Concert.where(Group_id: id).count
    end

    def total_number_of_people
        self.concerts.pluck(:number_of_people).sum
    end

end
