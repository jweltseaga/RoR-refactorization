class ApisController < ApplicationController

  hobo_model_controller

  auto_actions :none
  index_action :rss , :json, :sitemap, :contact

  def sitemap
  	@machines = Machine.find(:all)
  end

end
