class Admin::PostsController < ApplicationController

  def index #全投稿の一覧
    @posts = Post.all
  end

  def date_index #特定日の全投稿一覧
    @date = params[:date].gsub(/-/,'') #日時計算用にハイフンを除外
    @tomorrow = (@date.to_i + 1).to_s
    @yesterday = (@date.to_i - 1).to_s
    @posts = Post.where(date: @date)
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to admin_post_path(@post.id)
    else
      render :new
    end
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to admin_post_path(post)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :date, :user_id, :is_private)
  end
end
