class ArticleController < ApplicationController
  def index
    @articles = Article.find(:all, :order => 'updated_at DESC')
  end

  def show
    @article = Article.find(params[:id])
  end

  def news_articles
    @news_items = NewsItem.limit(4).order("updated_at DESC")
    @articles = Article.limit(3).order("updated_at DESC")
  end

end
