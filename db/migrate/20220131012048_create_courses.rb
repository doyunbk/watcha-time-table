class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :code
      t.string :title
      t.text :description
      t.string :professor
      t.string :location
      t.integer :capacity
      t.time :start_time
      t.time :end_time
      t.string :dayofweek

      t.timestamps
    end
  end
end
