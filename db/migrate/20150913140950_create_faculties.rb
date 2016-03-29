class CreateFaculties < ActiveRecord::Migration
  def up
    create_table :faculties do |t|
      t.string :name, null: false
      t.string :short, null: false
      t.text :description
      t.boolean :visible
      t.timestamps
    end
  end

  def down
    drop_table :faculties
  end
end
