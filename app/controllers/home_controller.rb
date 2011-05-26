class HomeController < ApplicationController
  def home
    @recent_natter = Natter.last(5)
  end

end
