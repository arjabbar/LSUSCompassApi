class AddEnrolledToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :enrolled, :integer
  end
end
