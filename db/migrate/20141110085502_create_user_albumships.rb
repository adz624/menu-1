class CreateUserAlbumships < ActiveRecord::Migration
  def change
    create_table :user_albumships do |t|
      t.integer :user_id
      t.integer :album_id

      t.timestamps
    end
  end
end
