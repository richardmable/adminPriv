class PostsController < ApplicationController
  def index
  end

  def show
  end

  def new
    current_user
    @post = Post.new
  end

  def create
    current_user
    no_current_user
    if post_params[:title] == "" || post_params[:content] == ""
      flash[:alert] = "Posts need to have both title and content"
      render "new"
    else
      @post = Post.create(post_params)
      @post.user_id = @currentUser.id
      redirect_to posts
    end
  end

  def destroy
  end

  private 

  def post_params
    params.require(:post).permit(:user_id, :title, :content)
  end


end
