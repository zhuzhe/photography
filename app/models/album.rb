class Album < ActiveRecord::Base

	has_many :photos
	belongs_to :cover, :class_name => 'Photo', :foreign_key => 'cover_id'

	DEFAULT_COVER = '/images/default_album_cover'

	def get_cover
	   self.cover && self.cover.id2relative_path || self.photos.first && self.photos.first.id2relative_path || DEFAULT_COVER
	end
	
end
