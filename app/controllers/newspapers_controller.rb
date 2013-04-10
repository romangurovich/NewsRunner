class NewspapersController < ApplicationController
	def show
		@newspaper = Newspaper.find(params[:id])
	end

	def index
		@newspapers = Newspaper.all
	end

	def new
		@newspaper = Newspaper.new
	end

	def create
		@newspaper = Newspaper.new(params[:newspaper])

		if @newspaper.save
			flash[:notice] = "Welcome #{@newspaper.title}!"
			redirect_to newspaper_url(@newspaper)
		else
			flash.now[:error] = @newspaper.errors.full_messages
			render :new
		end
	end

	def edit
		@newspaper = Newspaper.find(params[:id])
	end

	def update
		@newspaper = Newspaper.find(params[:id])
		@newspaper.assign_attributes(params[:newspaper])

		if @newspaper.save
			flash[:notice] = "Edited #{@newspaper.title}!"
			redirect_to newspaper_url(@newspaper)
		else
			flash.now[:error] = @newspaper.errors.full_messages
			render :edit
		end
	end

	def destroy
		@newspaper = Newspaper.find(params[:id]).destroy
		flash[:notice] = "Deleted #{@newspaper.title}!"
		redirect_to root_url
	end
end