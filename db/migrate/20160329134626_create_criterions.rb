class CreateCriterions < ActiveRecord::Migration
  def up
    create_table :criterions do |t|
      t.references :course
      t.integer :seats
      t.text :description
      t.timestamps
    end
  end

  def down
    drop_table :criterions
  end
end
