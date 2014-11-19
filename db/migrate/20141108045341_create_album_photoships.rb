class CreateAlbumPhotoships < ActiveRecord::Migration
  def change
    create_table :album_photoships do |t|
      t.integer :album_id
      t.integer :photo_id

      t.timestamps
    end
  end
end
