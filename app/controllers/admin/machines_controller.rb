class Admin::MachinesController < ApplicationController

  hobo_model_controller

  auto_actions :all

#  def edit
#  	@machine = Machine.find_by_permalink(params[:id])
#  end


end
