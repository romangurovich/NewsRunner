class SubscriptionsController < ApplicationController
	def show
		@subscription_plan = SubscriptionPlan.find(params[:id])
	end

	def index
		@subscription_plans = SubscriptionPlan.all
	end

	def new
		@subscription_plan = SubscriptionPlan.new
	end

	def create
		@subscription_plan = SubscriptionPlan.new(params[:subscription_plan])

		if @subscription_plan.save
			flash[:notice] = "Added subscription to #{@subscription_plan.newspaper.title}!"
			redirect_to subscription_url(@subscription_plan)
		else
			flash.now[:error] = @subscription_plan.errors.full_messages
			render :new
		end
	end

	def edit
		@subscription_plan = SubscriptionPlan.find(params[:id])
	end

	def update
		@subscription_plan = SubscriptionPlan.find(params[:id])
		@subscription_plan.assign_attributes(params[:subscription_plan])

		if @subscription_plan.save
			flash[:notice] = "Edited subscription!"
			redirect_to subscription_url(@subscriptionplan)
		else
			flash.now[:error] = @subscription_plan.errors.full_messages
			render :edit
		end
	end

	def destroy
		@subscription_plan = SubscriptionPlan.find(params[:id]).destroy
		flash[:notice] = "Deleted subscription!"
		redirect_to root_url
	end
end


