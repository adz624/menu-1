class Admin::PhotosController < Admin::BaseController

	def index
		@photos = Photo.all
	end

	def new
		@photo = Photo.new
	end

	def create
		@album = Album.find(session[:aid])
		@photo = @album.photos.create(photo_params)
		if @photo.save
			redirect_to admin_album_path(session[:aid])
		else
			render :new
		end
	end

	def destroy
		@photo = Photo.find(params[:id])
		@photo.destroy
		redirect_to admin_album_path(session[:aid])
	end

	def edit
		@photo = Photo.find(params[:id])
	end

	def update
		@photo = Photo.find(params[:id])
		if @photo.update(photo_params)
			redirect_to admin_album_path(session[:aid])
		else
			render :edit
		end
	end

	private

	def photo_params
		params.require(:photo).permit(:name, :city, :zone, :image, :id, :status)
	end
end
