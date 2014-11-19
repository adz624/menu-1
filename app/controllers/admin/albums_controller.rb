class Admin::AlbumsController < Admin::BaseController
	def index
		@albums = Album.all.page(params[:page])
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

	# DELETE /admin/albums/multi
	def multi_delete
		if album_deletion_params.empty?
			redirect_to :back, notice: '請選擇至少一筆 album'
		end

		Album.delete_all(id: album_deletion_params)
		redirect_to :back, notice: "已刪除 #{album_deletion_params.count} 筆資料。"
	end

	private
	def params_album
		params.require(:album).permit(:city, :name)
	end

	def album_deletion_params
		if params[:album_ids].blank?
			[]
		else
			params[:album_ids]
		end
	end
end