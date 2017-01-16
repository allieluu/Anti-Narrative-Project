class PostsController < ApplicationController

  before_action :current_user

  # before_action :authorize

  def index
    @posts = Post.sorted
  end

  def show
    @post = Post.find_by_permalink(params[:id])
  end

  def new
    logger.debug('Called "new" action')
    @post = Post.new
  end

  def create
    logger.debug('Called "create" action')
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Your post is now published!'
      redirect_to(posts_path)
    else
      redirect_to(new_post_path)
    end
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = 'Your post has been updated!'
      redirect_to(posts_path(@post))
    else
      render('edit')
    end
  end

  private

  def post_params
    # params.require(:post).permit(:user_id, :content, :all_tags)
    params.require(:post).permit(:title, :content, :user_id, :all_tags => [])
    params['post']['all_tags'] = params['post']['all_tags'].split(',').strip('"')
  end
end
