class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])

		if @user.save
			flash[:notice] = "Welcome #{@user.name}!"
			redirect_to user_url(@user)
		else
			flash.now[:error] = @user.errors.full_messages
			render :new
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.assign_attributes(params[:user])

		if @user.save
			flash[:notice] = "Edited #{@user.name}!"
			redirect_to user_url(@user)
		else
			flash.now[:error] = @user.errors.full_messages
			render :edit
		end
	end

	def destroy
		@user = User.find(params[:id]).destroy
		flash[:notice] = "Deleted #{@user.name}!"
		redirect_to root_url
	end
end
