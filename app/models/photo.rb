class Photo < ActiveRecord::Base
	#validates :name, :city, :zone, :image, presence: true
	scope :filter, ->(r){where(city: r).order("RAND()").limit(3) if r.present?}
	mount_uploader :image, ImageUploader
	has_many :album_photoships
	has_many :albums, :through => :album_photoships
end
