class Admin::CategoriesController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => :index
	auto_actions_for :site, :create
	#auto_actions :write_only,:edit,:index

end
