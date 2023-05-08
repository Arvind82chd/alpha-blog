class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @articles = Article.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @article = Article.new
  end

  def edit
  end
  

  def create
    @article = Article.new(strong_params)
    @article.user = User.first
    if @article.save
      flash[:notice] = "Article created successfully"
      redirect_to @article
    else
        render 'new'
    end
  end

  def update
    if @article.update(strong_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    if @article.destroy
      flash[:notice] = "Article was deleted successfully."
    redirect_to articles_path
    else
      flash[:notice] = "Error deleting Article"
      redirect_to @article
    end
  end

  

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def strong_params
    params.require(:article).permit(:title, :description)
  end


end
