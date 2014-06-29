class AddReferenceNumberToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :reference_number, :string
  end
end
