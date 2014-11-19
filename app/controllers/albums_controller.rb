class AlbumsController < ApplicationController
	before_action  :login_required,  :only  =>  [:new, :create, :show, :index, :edit, :update,:destroy]
	def index
		@user = User.find(current_user.id)
		@albums = @user.albums
		@album = Album.new
	end

	def new
		@album = Album.new
	end

	def create
		@user = User.find(current_user.id)
		@album = @user.albums.create(useralbum)
		if @album.save
			redirect_to albums_url
		else
			render :new
		end
	end

	def edit
		@album = Album.find(params[:id])
	end

	def update
		@album = Album.find(params[:id])
		if @album.update(useralbum)
			redirect_to albums_url
		else
			render :edit
		end
	end

	def show
		@album = Album.find(params[:id])
		session[:aid] = params[:id]
		@albumphotos = @album.photos
	end

	private
	def useralbum
		params.require(:album).permit(:name)
	end
end
