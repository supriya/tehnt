class CampsitesController < ApplicationController
  def new
    @campsite = Campsite.new
    @campgrounds = Campground.all
    render "edit"
  end

  def edit
    @campsite = Campsite.find self.params[:id]
    @campgrounds = Campground.all
  end

  def update
    @campsite = Campsite.find self.params[:id]
    @campsite.update_attributes(self.params[:campsite])
    redirect_to "/campgrounds/#{@campsite.campground.name}/campsites"
  end

  def create
    @campsite = Campsite.new(self.params[:campsite])
    @campsite.save!
    redirect_to "/campgrounds/#{@campsite.campground.name}/campsites"
  end

  def index
    @campground = Campground.find_by_name!(self.params[:campground_name],
      :include => 'campsites')
    render "list"
  end 
  
  
  def destroy
    @campsite = Campsite.find(params[:id]) 
    @campsite.delete
    redirect_to "/"
  end

end