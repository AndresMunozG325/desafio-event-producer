class CreateConcerts < ActiveRecord::Migration[6.0]
  def change
    create_table :concerts do |t|
      t.string :concert_name
      t.date :concert_date
      t.integer :number_of_people
      t.integer :duration
      t.references :Group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
