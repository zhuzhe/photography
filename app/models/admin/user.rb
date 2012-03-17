class Admin::User < ActiveRecord::Base
	set_table_name :users

 #   validates :name, :present => true
 #   validates :pwd, :present => true
 	validates :password, :presence => true
 	validates :pwd, :confirmation => true

 	ADMIN = 1

	class << self
		def admin
			first(:conditions => {:group => ADMIN})
		end
	end
 	
end
