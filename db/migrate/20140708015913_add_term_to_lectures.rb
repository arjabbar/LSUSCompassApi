class AddTermToLectures < ActiveRecord::Migration
  def change
    add_reference :lectures, :term, index: true
  end
end
