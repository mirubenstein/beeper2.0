class AddPhotoColumnToBeeps < ActiveRecord::Migration
  def change
    add_attachment :beeps, :photo
  end
end
