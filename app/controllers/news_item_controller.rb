class NewsItemController < ApplicationController
  def index
    @news_items = NewsItem.find(:all, :order => 'updated_at DESC')
  end

  def show
    @news_item = NewsItem.find(params[:id])
    @last_news = NewsItem.find(:all, :limit => 3, :order => "updated_at DESC")
  end

end
