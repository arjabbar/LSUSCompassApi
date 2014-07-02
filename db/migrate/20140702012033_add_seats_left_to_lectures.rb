class AddSeatsLeftToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :seats_left, :integer
  end
end
