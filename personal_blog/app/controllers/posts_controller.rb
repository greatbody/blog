class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  def index
    # Public homepage - show featured published posts
    @posts = Post.published.limit(6)
  end

  def blog_index
    # Public blog listing - all published posts
    @posts = Post.published
    render :blog_index
  end

  def show
    # Allow public viewing of published posts
    unless @post.published? || logged_in?
      redirect_to root_path, alert: "This post is not available."
    end
  end

  def admin_index
    # Admin-only view of all posts
    authenticate_user!
    @posts = Post.order(created_at: :desc)
    render :admin_index
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    
    if params[:post][:publish].present?
      @post.published = true
      @post.published_at = Time.current
    end
    
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end
  
  def update
    post_attributes = post_params
    
    if params[:post][:publish].present?
      post_attributes = post_attributes.merge(published: true, published_at: Time.current)
    end
    
    if @post.update(post_attributes)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @post.destroy
    redirect_to admin_posts_path, notice: 'Post was successfully deleted.'
  end
  
  private
  
  def set_post
    @post = Post.find_by!(slug: params[:id])
  end
  
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
