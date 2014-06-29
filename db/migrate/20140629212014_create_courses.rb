class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :description
      t.decimal :credit_hours
      t.decimal :contact_hours
      t.string :code

      t.timestamps
    end
  end
end
