class OpcommentsController < ApplicationController
	before_action  :login_required,  :only  =>  [:new, :create]

	def new
		@opinion = Opinion.find(params[:opinion_id])
		@opcomment = @opinion.opcomments.build
	end

	def create
		@opinion = Opinion.find(params[:opinion_id])
		@opcomment = @opinion.opcomments.new(params_opcomment)
		if @opcomment.save
			redirect_to opinion_path(@opinion)
		else
			render :new
		end
	end


	private
	def params_opcomment
		params.require(:opcomment).permit(:opinion_id, :content, :user_name)
	end
end
