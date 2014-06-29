class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.string :dom_value
      t.string :description

      t.timestamps
    end
  end
end
