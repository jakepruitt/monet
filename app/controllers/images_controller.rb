class ImagesController < ApplicationController
  before_filter :require_login

  def require_login
    if not signed_in?
      redirect_to sign_in_url
    end
  end

  def index
    

  end
end
