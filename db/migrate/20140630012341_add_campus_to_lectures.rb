class AddCampusToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :campus, :string
  end
end
