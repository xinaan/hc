class CreateSettings < ActiveRecord::Migration
  def up
    create_table :settings do |t|
      t.string :title , null: false
      t.string :jheader
      t.string :jtext
      t.string :lbook
      t.string :lform
      t.date :deadline
      t.string :alert
      t.text :intro
      t.timestamps
    end
  end

  def down
    drop_table :settings
  end
end
