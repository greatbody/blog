class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
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
    redirect_to posts_url, notice: 'Post was successfully deleted.'
  end
  
  private
  
  def set_post
    @post = Post.find_by!(slug: params[:id])
  end
  
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
