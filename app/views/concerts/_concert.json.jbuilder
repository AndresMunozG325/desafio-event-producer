json.extract! concert, :id, :concert_name, :concert_date, :number_of_people, :duration, :Group_id, :created_at, :updated_at
json.url concert_url(concert, format: :json)
