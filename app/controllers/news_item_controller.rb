class NewsItemController < ApplicationController
  def index
    @news_items = NewsItem.find(:all, :order => 'updated_at DESC')
  end

  def show
    @news_item = NewsItem.find(params[:id])
  end

end
