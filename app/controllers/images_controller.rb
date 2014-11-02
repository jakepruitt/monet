class ImagesController < ApplicationController
  before_filter :authorize

  def index
    @user = current_user
  end

  def create
    @user = current_user
    @image = @user.images.new(image_params)

    if @image.save
      redirect_to @image, notice: 'Image was successfully uploaded.'
    else
      render action: 'new'
    end
  end

  def new
    # This is empty since the new view doesn't have any dynamic content.
  end

  def edit
    @image = Image.find(params[:id])
    # Verify that they are requesting an image that they actually own.
    if @image.user_id != current_user.id
      # If the user doesn't own this image, pretend we didn't find an image.
      raise ActiveRecord::RecordNotFound
    end
  end

  def show
    @image = Image.find(params[:id])
    # Verify that they are requesting an image that they actually own.
    if @image.user_id != current_user.id
      # If the user doesn't own this image, pretend we didn't find an image.
      raise ActiveRecord::RecordNotFound
    end
  end

  def update
    @image = Image.find(params[:id])
    # Verify that they are requesting an image that they actually own.
    if @image.user_id != current_user.id
      # If the user doesn't own this image, pretend we didn't find an image.
      raise ActiveRecord::RecordNotFound
    end

    puts params[:image].class
    puts params[:image].to_s

    if @image.update(image_params)
      redirect_to @image
    else
      render action: 'show'
    end
  end

  def destroy
    @image = Image.find(params[:id])
    # Verify that they are requesting an image that they actually own.
    if @image.user_id != current_user.id
      # If the user doesn't own this image, pretend we didn't find an image.
      raise ActiveRecord::RecordNotFound
    end

    @image.destroy
    redirect_to images_path
  end

  private

  def image_params
    params.require(:image).permit(:image, :title, :description)
  end

end
