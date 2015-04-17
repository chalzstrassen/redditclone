class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_credentials(user_params)
    if user
      login!(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = user.errors.full_messages
      render :new
    end
    
  end

  def destroy

  end

end
