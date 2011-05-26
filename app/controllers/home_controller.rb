class HomeController < ApplicationController
  def home
    @recent_natter = Natter.find(:all, :order => "id desc", :limit => 5)
  end

end
