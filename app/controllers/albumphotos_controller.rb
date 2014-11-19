class AlbumphotosController < ApplicationController
	before_action  :login_required,  :only  =>  [:new, :create, :show, :index, :edit, :update,:destroy]
	def index
		@albumphotos = Photo.all
	end

	def new
	end

	def create
		@album = Album.find(session[:aid])
		@albumphoto = @album.photos.create(params_albumphoto)
		if @albumphoto.save
			redirect_to album_path(session[:aid])
		else
			render :new
		end
	end

	def edit
		@albumphoto = Photo.find(params[:id])
	end

	def update
		@albumphoto = Photo.find(params[:id])
		if @albumphoto.update(params_albumphoto)
			redirect_to album_path(session[:aid])
		else
			render :new
		end
	end

	def destroy
		@albumphoto = Photo.find(params[:id])
		@albumphoto.destroy
		redirect_to album_path(session[:aid])
	end

	private
	def params_albumphoto
		params.require(:albumphoto).permit(:name, :city, :zone, :image, :id, :status)
	end
end
