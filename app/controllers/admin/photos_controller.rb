class Admin::PhotosController < Admin::AlbumsController
	before_action  :login_required,  :only  =>  [:new, :create, :show, :index, :edit, :update,:destroy]
	def index
		@photos = Photo.all
	end

	def new
		@photo = Photo.new
	end

	def create
		@album = Album.find(session[:aid])
		@photo = @album.photos.create(params_photo)
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
		if @photo.update(params_photo)
			redirect_to admin_album_path(session[:aid])
		else
			render :edit
		end
	end

	private
	def params_photo
		params.require(:photo).permit(:name, :city, :zone, :image, :id, :status)
	end
end
