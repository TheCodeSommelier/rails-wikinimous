class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @new_article = Article.new
  end

  def create
    @new_article = Article.create(article_parameters)
    redirect_to article_path(@new_article)
  end

  def edit
  end

  def update
    @article.update(article_parameters)
    redirect_to articles_path
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_parameters
    params.require(:article).permit(:title, :content)
  end
end
