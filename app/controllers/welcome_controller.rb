class WelcomeController < ApplicationController
  def index       
      @photos = Photo.limit(20)
  end   
  
  def brand
    
  end

end
