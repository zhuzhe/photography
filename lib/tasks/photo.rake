require 'rubygems'
require 'mini_magick'       
index = 0
def traverse_dir(file_path, &block)  
      if File.directory? file_path  
         Dir.foreach(file_path) do |file|  
           if file!="." and file!=".."  
             traverse_dir(file_path+"/"+file){|x| yield x}  
           end  
         end  
       else  
         if block
             yield  file_path  
         end
       end
end

namespace :photo do 
    task :convert do 
       traverse_dir("/Users/zhuzhe/Desktop/1") do |f|
         if f.to_s.match(/\.JPG/)         
             puts f.to_s
             image = MiniMagick::Image.open(f.to_s) 
             image.resize "800x600"
             image.write "/Users/zhuzhe/Desktop/images/#{index + 1}.jpg"
             return
         end
       end 
    end
end

