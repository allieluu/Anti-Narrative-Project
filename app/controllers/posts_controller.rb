class PostsController < ApplicationController
  def index
    @posts = Post.sorted
  end

  def show
    @post = Post.find_by_permalink(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Your post is now published!'
    else
      redirect_to(posts_index_path)
    end
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = 'Your post has been updated!'
      redirect_to(posts_index_path(@post))
    else
      render('edit')
    end
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :content, :all_tags)
  end
end
