class Admin::CategoriesController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => :index
	auto_actions_for :site, :create
	#auto_actions :write_only,:edit,:index

	def show
		hobo_show Category.find_by_name(params[:id])
	end
	
	def edit
		hobo_show Category.find_by_name(params[:id])
	end

	def update
		hobo_update Category.find_by_name(params[:id])
	end
	
	def edit
		hobo_destroy Category.find_by_name(params[:id])
	end

end
