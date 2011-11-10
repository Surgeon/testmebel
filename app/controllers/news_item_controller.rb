
class NewsItemController < ApplicationController
  def index
    @news_items = NewsItem.find(:all, :order => 'updated_at DESC').paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @news_item = NewsItem.find(params[:id])
    @last_news = NewsItem.find(:all, :limit => 3, :order => "updated_at DESC")
    @title_news = @news_item.title + t('title_news')
  end

end
