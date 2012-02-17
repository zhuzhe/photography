class Admin::Production < ActiveRecord::Base
	set_table_name :productions

	validates :name, :presence => true
	validates :category, :presence => true
	validates :category, :exclusion => { :in => %w(1 2),
    :message => "type %{value} is reserved." }
end
