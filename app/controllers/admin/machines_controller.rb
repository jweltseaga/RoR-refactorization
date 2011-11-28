class Admin::MachinesController < ApplicationController

  hobo_model_controller

  auto_actions :all

=begin
	def show
		hobo_show Machine.find_by_name(params[:id])
	end
	
	def edit
		hobo_show Machine.find_by_name(params[:id])
	end
	
	def update
		hobo_update Machine.find_by_name(params[:id])
	end
	
	def destroy
		hobo_destroy Machine.find_by_name(params[:id])
	end
=end

	def show
		hobo_show Machine.find_by_permalink(params[:id])
	end
	
	def edit
		hobo_show Machine.find_by_permalink(params[:id])
	end
	
	def update
		hobo_update Machine.find_by_permalink(params[:id])
	end
	
	def destroy
		hobo_destroy Machine.find_by_permalink(params[:id])
	end

end
