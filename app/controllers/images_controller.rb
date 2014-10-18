class ImagesController < ApplicationController
  before_filter :authorize

  def index
    @user = User.find(current_user.id)
  end

  def create
    @user = User.find(current_user.id)
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
    unless @image.user_id === current_user.id
      redirect_to root_url
    end
  end

  def show
    @image = Image.find(params[:id])
    # Verify that they are requesting an image that they actually own.
    unless @image.user_id === current_user.id
      redirect_to root_url
    end
  end

  def update
    @image = Image.find(params[:id])
    # Verify that they are requesting an image that they actually own.
    unless @image.user_id === current_user.id
      redirect_to root_url
    end

    if @image.update(image_params)
      redirect_to @image
    else
      render edit_image_path
    end
  end

  def destroy
    @image = Image.find(params[:id])
    # Verify that they are requesting an image that they actually own.
    unless @image.user_id === current_user.id
      redirect_to root_url
    end

    @image.destroy
    redirect_to images_path
  end

  private

  # def validate_access(image)
  #   unless image.user_id === current_user.id
  #     @user = User.find(current_user.id)
  #     redirect_to 'index', notice: 'You do not have permission to view that image.'
  #   end
  # end

  def image_params
    params.require(:image).permit(:image, :title, :description)
  end

end
