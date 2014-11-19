class Admin::AlbumsController < ApplicationController
	before_action  :login_required,  :only  =>  [:new, :create, :show, :index, :edit, :update,:destroy]
	def index
		@albums = Album.all
	end

	def new
		@album = Album.new
	end

	def create
		@album = Album.new(params_album)
		if @album.save
			redirect_to admin_albums_url
		else
			render :new
		end
	end

	def destroy
		@album = Album.find(params[:id])
		@album.destroy
		redirect_to admin_albums_url
	end

	def edit
		@album = Album.find(params[:id])
	end

	def update
		@album = Album.find(params[:id])
		if @album.update(params_album)
			redirect_to admin_albums_url
		else
			render :edit
		end
	end

	def show
		@album = Album.find(params[:id])
		session[:aid] = params[:id]
		@photos = @album.photos
	end

	private
	def params_album
		params.require(:album).permit(:city, :name)
	end
end
