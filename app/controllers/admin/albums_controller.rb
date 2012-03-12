class Admin::AlbumsController < AdminController

  layout 'admin'

  def index
    @albums = Admin::Album.all
  end

  def new
    @album = Admin::Album.new
  end

  def show
    @album = Admin::Album.find(params[:id])
    @photos = @album.photos.paginate(:per_page => 20, :page => params[:page])
  end

  def edit
    @album = Admin::Album.find(params[:id])
  end

  def create
    @album = Admin::Album.create(params[:admin_album])
    redirect_to @album
  end

  def update
    @album = Admin::Album.find(params[:id])
    @album.update_attributes(params[:admin_album])
    redirect_to @album
  end

  def destroy
    @album = Admin::Album.find(params[:id])
    @album.destroy
    redirect_to admin_albums_path
  end

  def add_photo
    @album = Admin::Album.find(params[:id])
    @photos = Photo.no_album.paginate(:per_page => 20, :page => params[:page]).order('created_at DESC')
  end

  def create_photo
    @album = Admin::Album.find(params[:id])
    @photo = Photo.find_by_id(params[:photo_id]) || Photo.first
    @album.photos << @photo
    @album.save
    render :json => {:status => :succss}
  end

  def remove_photo
    @album = Admin::Album.find(params[:id])
    @photo = Photo.find(params[:photo_id])
    @album.photos.delete @photo
    render :json => {:status => :success}
  end

  def set_cover
    @album = Admin::Album.find(params[:id])
    @photo = Photo.find(params[:photo_id])
    @album.cover = @photo
    @album.save
    render :json => {:status => :success}
  end

end
