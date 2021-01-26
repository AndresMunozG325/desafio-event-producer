class Group < ApplicationRecord
    has_many :concerts, dependent: :destroy
    validates :name, presence: true
    validates :debut_date, presence: true
    validates :number_of_members, presence: true
    validates :type_of_band, presence: true
    has_many :crews, dependent: :destroy
    
    enum type_of_band: [:Men, :Women, :Band]

    def number_of_concert
        Concert.where(Group_id: id).count
    end

    def total_number_of_people
        self.concerts.pluck(:number_of_people).sum
    end

    def concerts_this_month
        @concerts = Concert.where(Group_id: id)
        concerts_month = []
        @concerts.each do |concert|
            if concert.concert_date > Time.now.beginning_of_month && concert.concert_date < Time.now.end_of_month
                concerts_month.push(concert.concert_date)
            end
        end
        if concerts_month.any?
            concerts_month.count
        else
            "Don't have concerts this month"
        end
    end

    def the_last_concert
        if self.concerts.count > 0
            self.concerts.order(concert_date: :asc).last.concert_date
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
