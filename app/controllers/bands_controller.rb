class BandsController < ApplicationController
before_action :logged_in?

  def index
    @bands = Band.all
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      render :new
    end
  end

  def show
    @band = Band.find_by_id(params[:id])
    render :show
  end

  def edit
    render :edit
  end

  def update
  end

  def destroy
    @band = Band.find_by_id(params[:id])
  end

  def band_params
    self.params[:band].require[:name]
  end
end
