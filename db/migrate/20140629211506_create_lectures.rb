class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.time :start_time
      t.time :end_time
      t.date :start_date
      t.date :end_date
      t.string :details_url
      t.string :session
      t.string :room
      t.string :building

      t.timestamps
    end
  end
end
