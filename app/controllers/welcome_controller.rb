class WelcomeController < ApplicationController
  
  def index
    if request.post? && params[:ad] && params[:ad] != ""
      @longitude = Map.geocode(params[:ad])
    end
    
  end 
end
