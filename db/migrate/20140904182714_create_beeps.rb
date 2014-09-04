class CreateBeeps < ActiveRecord::Migration
  def change
    create_table :beeps do |t|
      t.string :beep
      t.belongs_to :user
      t.timestamps
    end
  end
end
