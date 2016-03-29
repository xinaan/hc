class CreatePros < ActiveRecord::Migration
  def up
    create_table :pros do |t|
      t.references :course
      t.text :description
      t.timestamps
    end
  end

  def down
    drop_table :pros
  end
end
