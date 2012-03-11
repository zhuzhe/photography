class Album < ActiveRecord::Base

	has_many :photos

	DEFAULT_COVER = '/images/default_album_cover'

	def cover
		self.photos.first.id2relative_path || DEFAULT_COVER
	end
end
