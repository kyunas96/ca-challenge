class CreateCourse < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.datetime :release_date

      t.timestamp
    end
  end
end
