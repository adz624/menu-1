class OpinionsController < ApplicationController
	before_action  :login_required,  :only  =>  [:new, :create, :show, :index]

	def index
		@opinions = Opinion.page(params[:page]).per(8)
	end

	def new
		@opinion = Opinion.new
	end

	def create
		@opinion = Opinion.new(params_opinion)
		if @opinion.save
			redirect_to opinions_url
		else
			render :new
		end
	end

	def show
		@opinion = Opinion.find(params[:id])
		@opcomments = @opinion.opcomments.page(params[:page]).per(5)

		@opcomment = @opinion.opcomments.new
	end

	private
	def params_opinion
		params.require(:opinion).permit(:title, :content)
	end
end
