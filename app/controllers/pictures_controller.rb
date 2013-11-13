class PicturesController < ApplicationController
  def show
  	@id = params[:id].to_i
  	@picture = Picture.find(@id)
  end

  def index
	@list_of_pictures = Picture.all
  end

  def new
    
  end

  def create
    @caption = params[:caption]
    @source = params[:source]

    p = Picture.new
    p.source = @source
    p.caption = @caption
    p.save
    redirect_to(pictures_url, { :notice => "Picture created successfully."})
  end

  def destroy
    @id = params[:id].to_i
    Picture.find(@id).destroy
    redirect_to(pictures_url, { :notice => "Picture has been toasted."})
  end

  def edit
    @id = params[:id].to_i
    @picture = Picture.find(@id)

    @caption = Picture.find(@id).caption
    @source = Picture.find(@id).source
  end
  
  def update
    @id = params[:id].to_i
    @caption = params[:caption]
    @source = params[:source]
    
    p = Picture.find(@id)
    p.caption = @caption
    p.source = @source
    p.save

    @picture = Picture.find(@id)
    redirect_to picture_url(p.id), :notice => "Picture has been updated."
  end

end
