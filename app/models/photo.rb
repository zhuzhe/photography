class Photo < ActiveRecord::Base     

    belongs_to :album
    belongs_to :admin_album, :class_name => 'Admin::Album', :foreign_key => 'album_id'

    scope :no_album, where(:album_id => nil)
    
    ROOT_DIR = Rails.root.join('public', 'images', 'photos')
    THUMB_DIR = Rails.root.join('public', 'images', 'thumbs')

    after_destroy do |p|
      if File.exist? p.id2path
        File.delete p.id2path
      end

      if File.exist? p.id2thumb_path
        File.delete p.id2thumb_path
      end
    end

    def category_text
      case self.category_id
      when 1
         then  "婚纱照"
        when 2
           then  "艺术照"  
      end
    end
    
    def id2path
      self.id2(ROOT_DIR) + '.jpg'
    end               
    
    def id2relative_path
      "/images/photos/" + self.id.to_s.rjust(9, '0').scan(/\d{3}/).join('/')  + '.jpg'
    end

    def id2thumb_path
      self.id2(THUMB_DIR) + '.jpg'
    end

    def id2thumb_relative_path
      "/images/thumbs/" + self.id.to_s.rjust(9, '0').scan(/\d{3}/).join('/')  + '.jpg'
    end
         
    def id2 root
      dir1, dir2, file = self.id.to_s.rjust(9, '0').scan(/\d{3}/)
      Dir.mkdir(root.join(dir1)) unless File.directory?(root.join(dir1))
      Dir.mkdir(root.join(dir1, dir2)) unless File.directory?(root.join(dir1, dir2))
      root.join(dir1, dir2, file).to_s
    end   
    
    def next                     
      max_id = Photo.maximum('id')
      if self.id < max_id
          Photo.where("id > #{self.id}").order('id').limit(1).first
      else
          Photo.first
      end
    end        
    
    def prev
        min_id = Photo.minimum('id')
        if self.id > min_id
            Photo.where("id < #{self.id}").limit(1).first
        else
            Photo.last
        end
    end

    def create_image
      image = MiniMagick::Image.open(self.id2path)
      if image[:width] >= image[:height]
        image.resize "730x487"
      else
        image.resize "540x750"
      end
      image.write self.id2path
    end

    def create_thumb
      return unless File.exist?(self.id2path)
      image = MiniMagick::Image.open(self.id2path)
      image.resize "219x146"
      image.write self.id2thumb_path
    end
end
