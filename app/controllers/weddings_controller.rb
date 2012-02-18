class WeddingsController < ApplicationController    
    def index 
         @productions = Production.where(:category => '2')
         @production = Production.find_by_id(params[:production_id]) || @productions.first 
    end      
    
    def show
        
    end
end
