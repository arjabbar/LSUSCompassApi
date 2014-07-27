class AddBookUrlToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :book_url, :string
  end
end
