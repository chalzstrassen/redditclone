class PostsController < ApplicationController
  def new
    @post = Post.new
    @post.sub_id = params[:sub_id]
  end

  def create
    @post = Post.new(post_params)
    @post.sub_id = params[:sub_id]
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.sub_id = params[:sub_id]
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  private
    def post_params
      params.require(:post).permit(:user_id,
                                   :content,
                                   :sub_id,
                                   :title,
                                   :url_attrib)
    end
end
