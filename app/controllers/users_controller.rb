class UsersController < Clearance::UsersController

  def edit
    # Verify that they are using the account that they are attempting to edit.
    @user = current_user
    if @user.id.to_s != params[:id]
      # Pretend that we didn't find a user.
      raise ActiveRecord::RecordNotFound
    end
  end

  def update
    # Verify that they are using the account that they are attempting to edit.
    @user = current_user
    if @user.id.to_s != params[:id]
      # Pretend that we didn't find a user.
      raise ActiveRecord::RecordNotFound
    end

    if @user.update(user_params)
      redirect_to root_url
    else
      render action: 'edit'
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:fullname, :avatar)
  end

end
