class WebsitesController < ApplicationController

  def index
    @websites = Website.all
    if %w[asc desc].include?(params[:upvotes])
      @websites = @websites.order({upvotes_count: params[:upvotes]})
    end
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
    website = Website.find_by(id: params[:id])
    if website.destroy
      flash[:success] = 'Le record à bien été supprimé'
    else
      flash[:error] = 'Impossible de supprimer ce website'
    end
    redirect_to websites_url
  end

  private

  def website_params
    params.require(:website).permit(:name, :url)
  end

end