class MachinesController < ApplicationController

  hobo_model_controller

  auto_actions :show, :index


	#def show
#		hobo_show Machine.find_by_name(params[:id])
#	end

	
	def index
		@machine = Machine.find_by_permalink(params[:id])
	end

end
