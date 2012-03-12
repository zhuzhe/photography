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
             image.resize "1000x1000"
             image.write "/Users/zhuzhe/Desktop/photos/#{index + 1}.jpg" 
             index = index + 1
         end  
       end 
    end
    
    task :store  => :environment do
        root = "/Users/zhuzhe/Desktop/photos"
        Dir.foreach(root) do |filename|    
            f = File.new("#{root}/#{filename}")  
            next if File.directory? f
            photo = Photo.create                 
            path = "#{photo.id2(Pathname.new("/Users/zhuzhe/Pictures/photos"))}.jpg" 
            image = MiniMagick::Image.open(f.path)
            image.write path
            puts path
        end
    end   
    
    task :change => :environment do
         root = Rails.root.join('public', 'images', 'photos')
            traverse_dir(root.to_s) do |f| 
                image = MiniMagick::Image.open(f.to_s)  
                image.resize "560x560"
                image.write f.to_s
                puts f.to_s
            end
    end

    desc "convert to thumb"
    task :convert_to_thumb => :environment do
        Photo.find_each do |photo|
            photo.create_thumb
            puts photo.id2thumb_path
        end
    end
end

