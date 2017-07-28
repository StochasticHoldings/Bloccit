class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
    respond_to do |format|
      format.html
    end
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    @advertisement = Advertisement.new(advertisement_params)
    @advertisement.save
    redirect_to advertisements_path
  end

  private
  def advertisement_params
    params.require(:advertisement).permit(:title, :body, :price)
  end
end
