class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      
      t.string :city
      t.string :zone
      t.string :name

      t.timestamps
    end
  end
end
