class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.string :city
      t.string :zone
      t.string :image
      t.string :status

      t.timestamps
    end
  end
end
