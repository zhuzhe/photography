class Admin::PhotosController < AdminController

  layout 'admin'

  def index
    @photos = Photo.paginate(:per_page => 20, :page => params[:page])
  end

  def show
    @photo= Photo.find(params[:id])
  end

  def edit
    @photo= Photo.find(params[:id])
  end

  def new
    @photo= Photo.new
  end

  def create
    @photo = Photo.create(params[:photo])
    uploaded_io = params[:file]
    File.open(@photo.id2path, 'w') do |file|
      file.write(uploaded_io.read)
    end
    @photo.create_image
    redirect_to edit_admin_photo_path(@photo)
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update_attributes(params[:photo])
    render :json => {:status => 'success', :category => @photo.category_text}
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to admin_photos_path
  end

end
