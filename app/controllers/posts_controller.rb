class PostsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "123", except: [:index, :show]

  before_action :set_post, only: [:show]
  before_action :authorise_user, only: %i[new create edit update destroy]
  before_action :authorize_post, only: %i[edit, update, destroy]
  def index  #Обработка главной страницы
    @post = Post.all
  end

  def new   #Создаем статью
    @post = Post.new;
  end

  def show
    return render_not_found unless @post.user == @current_user
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def create #Работа кнопки сохранить статью
    #render plain:params[:post].inspect  просто проверка
    @post = @current_user.posts.create(post_params)
    @post.save    #Сохраняем пост
    if @post.save
      redirect_to @post #Перемещаем пользователя на новую страницу
    else
      render 'new'
    end
  end

  private

  def authorize_post
    render_not_found unless @post.user == @current_user
  end

  private

  def set_post
    @post= Post.find_by_id(params[:id])
  end


  def post_params   #Описываем какие параметры разрешено использовать в Post
    params.require(:post).permit(:title, :body)
  end
end
