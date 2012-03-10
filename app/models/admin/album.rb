class Admin::Album < ActiveRecord::Base
	set_table_name :albums

	has_many :photos
	belongs_to :cover, :class_name => 'Photo', :foreign_key => 'cover_id'

	def category
		case self.category_id
		when 2
		   then  "婚纱照"
		  when 1
		   then  "艺术照"  
		end
	end
end