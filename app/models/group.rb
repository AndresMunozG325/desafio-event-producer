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

    def concerts_this_month
        if self.concerts.count > 0
            self.concerts.where('extract(year from date) = ?', Time.now.year).where('extract(month from date) = ?', Time.now.month).count 
        else 
            return 0  
        end
    end

    def the_last_concert
        if self.concerts.count > 0
            self.concerts.order(date: :asc).last.date
        else
            "no debut"
        end
    end  

    def amount_of_public
        self.concerts.pluck(:number_of_people).max
    end

    def concert_duration
        self.concerts.pluck(:duration).max
    end

end
