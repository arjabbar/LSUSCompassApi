class AddClassSizeToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :class_size, :integer
  end
end
