class Admin::Album < ActiveRecord::Base
	set_table_name :albums

	has_many :photos, :order => 'created_at DESC'
	belongs_to :cover, :class_name => 'Photo', :foreign_key => 'cover_id'

	def category
		case self.category_id
		when 2
		   then  "婚纱照"
		  when 1
		   then  "艺术照"  
		end
	end

	DEFAULT_COVER = '/images/default_album_cover'

	def get_cover
	   self.cover && self.cover.id2relative_path || self.photos.first && self.photos.first.id2relative_path || DEFAULT_COVER
	end
end