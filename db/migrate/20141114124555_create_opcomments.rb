class CreateOpcomments < ActiveRecord::Migration
  def change
    create_table :opcomments do |t|
      t.integer :opinion_id
      t.text :content
      t.string :user_name

      t.timestamps
    end
  end
end
