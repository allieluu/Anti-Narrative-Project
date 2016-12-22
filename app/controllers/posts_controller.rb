class PostsController < ApplicationController
  def index
    @posts = Post.sorted
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Your post is now published!"
    else
      
    end
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :content, :all_tags)
  end
end
