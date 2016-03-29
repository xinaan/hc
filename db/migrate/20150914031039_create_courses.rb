class CreateCourses < ActiveRecord::Migration
  def up
    create_table :courses do |t|
      t.string :name , null: false
      t.string :code
      t.references :faculty
      t.string :level
      t.integer :semester
      t.string :mode
      t.integer :seats
      t.decimal :fee
      t.boolean :visible
      t.timestamps
  end
  end

  def down
    drop_table :course
  end
end
