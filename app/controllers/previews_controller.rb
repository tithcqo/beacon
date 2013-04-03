class PreviewsController < ApplicationController
before_filter :custom_method, :only => [:new,:create, :edit, :destroy,:index]
	def new
		@preview = Preview.new	
		#@course = Course.all
	end

	def create
		@preview =Preview.new(params[:preview])
		if @preview.save
			flash[:success] = "preview added successfully!!!!"
			redirect_to new_preview_path
		else
		
		render 'new'

		end
	end

	def index
		@previews = Preview.paginate(page: params[:page], :per_page => 10).order(:sequence)
		@course = Course.all
	end

	def edit
		@preview= Preview.find(params[:id])
		@course = Course.all
	end

	def update
		@preview = Preview.find(params[:id])
		if @preview.update_attributes(params[:preview])

			redirect_to previews_path, notice: "Successfully updated preview."		
		else
			render :edit
		end
	end

	def destroy
		@preview = Preview.find(params[:id])

		@preview.destroy

		flash[:success] = "Successfully destroyed preview."
		redirect_to previews_path
	end



end
