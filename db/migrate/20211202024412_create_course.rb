class CreateCourse < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name, unique: true, null: false
      t.datetime :release_date, null: false

      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false

      t.timestamp
    end

    add_index :courses, :name, unique: true
  end
end
