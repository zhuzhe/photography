class Admin::User < ActiveRecord::Base
	set_table_name :users

 #   validates :name, :present => true
 #   validates :pwd, :present => true
 	validates :pwd, :presence => {:message => '密码不能为空'}, :length => {:in => 6..20, :message => '密码长度必须为6到20个字符'}
 	validates :pwd, :confirmation => {:message => '2次输入的新密码不相同'}
 	validates :pwd_confirmation, :presence => {:message => '请重复输入新密码'}

 	ADMIN = 1

	class << self
		def admin
			first(:conditions => {:group => ADMIN})
		end
	end
 	
end