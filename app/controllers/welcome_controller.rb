class WelcomeController < ApplicationController
  def index       
      @photos = Photo.limit(30)
  end   
  
  def brand
    
  end

end
