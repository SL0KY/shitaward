class WebsitesController < ApplicationController

  def index
    @websites = Website.all
  end

  def show
    @website = Website.find_by(id: params[:id])
  end

  def new
    @website = Website.new
  end

  def create
    @website = Website.new(website_params)
    if @website.save
      redirect_to websites_url
    else
      render :new
    end
  end

  def edit
    @website = Website.find_by(id: params[:id])
  end

  def update
    @website = Website.find_by(id: params[:id])
    if @website.update(website_params)
      redirect_to websites_url
    else
      render :new
    end
  end

  def destroy
    @website = Website.find_by(id: params[:id])
    @website.destroy
  end

  private

  def website_params
    params.require(:website).permit(:name, :url)
  end

end