class Admin::Message < ActiveRecord::Base
    set_table_name 'messages'

    def get_title
    	self.title || '无主题'
    end
    
end