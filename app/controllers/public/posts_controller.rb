class Public::PostsController < ApplicationController

  def index #全投稿の一覧
    @posts = Post.where("(is_private = ?) OR (user_id == ?)", false, current_user) #「公開」設定の投稿or自身の投稿を取得
  end

  def date_index #特定日の全投稿一覧
    @date = params[:date]
    @posts = Post.where(date: @date).where("(is_private = ?) OR (user_id == ?)", false, current_user)
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post.id)
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
    if @post.is_private == true && @post.user != current_user
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'この記念日は非公開です' }
      end
    end

  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :date, :user_id, :is_private)
  end

end
