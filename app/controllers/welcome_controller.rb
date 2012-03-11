class WelcomeController < ApplicationController
  def index       
  	@albums = Album.all
  end   
  
  def brand
    
  end

end
