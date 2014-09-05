class CreateConnectionsTable < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.belongs_to :beeper
      t.belongs_to :follower
      t.timestamps
    end
  end
end
