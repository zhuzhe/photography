class Admin::User < ActiveRecord::Base
	set_table_name :users

	validates :name, :present => true
	validates :pwd, :present => true
end
