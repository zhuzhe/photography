class Admin::Message < ActiveRecord::Base
    set_table_name 'messages'

    def get_title
    	self.title.blank? ? '无主题' : self.title
    end
    
end