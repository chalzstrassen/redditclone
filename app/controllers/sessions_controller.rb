class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_credentials(*user_params.values)
    if user
      login!(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = user.errors.full_messages
      render :new
    end

  end

  def destroy
    logout!
    redirect_to new_session_url
  end

end
