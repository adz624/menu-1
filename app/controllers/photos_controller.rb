class PhotosController < ApplicationController
	def index
		@photos = Photo.filter(params[:r])

		@photo = Photo.new
	end

	def new
		@photo = Photo.new
	end

	def create
		@album = Album.find(5)
		@photo = @album.photos.create(params_photo)
		if @photo.save
			redirect_to photos_url
		else
			render :new
		end
	end

	private
	def params_photo
		params.require(:photo).permit(:name, :city, :zone, :image, :status)
	end
end
