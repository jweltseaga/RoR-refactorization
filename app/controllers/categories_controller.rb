class CategoriesController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => :index
	auto_actions_for :site, :create

	#def index
#		@category = Category.find_by_permalink(params[:id])
#		hobo_index Category.join(:sites).where("sites.name = &{I18n.locale}")
#	end

#	def show
#		@category = Category.find_by_permalink(params[:id])
#	end

end
