class AlbumsController < ApplicationController
  def new
    @album = Albums.new
    render :new
  end

  def create
    @album = Albums.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      render :new
    end
  end

  def show
    @album = Albums.find_by_id(params[:id])
    render :show
  end


  def edit
    @album = Albums.find_by_id(params[:id])
  end

  def update
    @album = Albums.find_by_id(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      render :edit
    end
  end

  def destroy
    @album = Albums.find_by_id(params[:id])
    @album.delete
    redirect_to bands_url
  end

  def album_params
    self.params.require(:album).permit(:title,:recording_style, :band_id)
  end
end
