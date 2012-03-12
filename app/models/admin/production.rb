class Admin::Production < ActiveRecord::Base
	set_table_name :productions

	validates :name, :presence => true
	validates :category, :presence => true
	validates :category, :exclusion => { :in => %w(1 2),
    :message => "type %{value} is reserved." }

    def category_text
    	case self.category
    	when 2
    		 then  "婚纱照"
        when 1
    	     then  "艺术照"	
    	end
    end
end
