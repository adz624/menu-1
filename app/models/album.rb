class Album < ActiveRecord::Base	
	has_many :album_photoships
	has_many :photos, :through => :album_photoships
	has_many :user_albumships
	has_many :users, :through => :user_albumships
end
