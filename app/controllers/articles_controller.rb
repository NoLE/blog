class ArticlesController < ApplicationController

  #before_action :validate_user, except: [:show,:index]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_article, except: [:index,:new,:create]
  def index
   @articles = Article.all
  end
  def show
    @article.update_visits_count
    @comment = Comment.new
    #encontrar un reqgistro
    #@article = Article.find(params[:id])
    #encontrar un registro bajo especificacion
    #@article.where(" body LIKE ?","%Bienvenido%") encuentra todos los articulos que contienen la palabra bienvenido en el body
  end
  def new
    @article = Article.new
    @categories = Category.all
  end

  def create
    @article = current_user.articles.new(article_params)
    @article.categories = params[:categories]
      if @article.save
        redirect_to @article
      else
        render :new
      end
  end

  def destroy

    @article.destroy #destroy elimina el objeto en la base de datos
    redirect_to articles_path
  end

  def update

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end
  def edit

  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

    #def validate_user
      #redirect_to new_user_session_path, notice: "Necesitas Iniciar Sesión"
    #end
    def article_params
      params.require(:article).permit(:title, :body, :cover, :categories)

    end

end
