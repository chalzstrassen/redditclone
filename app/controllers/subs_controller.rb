class SubsController < ApplicationController
  def index
    @subs = Sub.all
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    if new_sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update

  end

  private
    def sub_params
        params.require(:sub).permit(:user_id, :title, :description)
    end
end
