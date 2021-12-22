class PostsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "123", except: [:index, :show]

  def index  #Обработка главной страницы
    @post = Post.all
  end

  def new   #Создаем статью
    @post = Post.new;
  end

  def show
    unless @post
      return render "#{Rails .root}/public/404.html" unless
    end
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if(@post.update(post_params))
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
    @post = Post.new(post_params)
    @post.save;     #Сохраняем пост
    if(@post.save)
      redirect_to @post #Перемещаем пользователя на новую страницу
    else
      render 'new'
    end
  end

  private def post_params   #Описываем какие параметры разрешено использовать в Post
    params.require(:post).permit(:title, :body)
  end
end
