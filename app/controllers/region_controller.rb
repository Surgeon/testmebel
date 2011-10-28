class RegionController < ApplicationController
  def index
    @regions = Region.all
    @million_cities = City.find_all_by_million(true)
    @main_news = NewsItem.last
    @news = NewsItem.find(:all, :limit => "1,8", :order => "updated_at DESC")
    @articles = Article.find(:all, :limit => 4)
  end

  def show
    region = Region.find_by_friendly_url(params[:friendly_url])
    @reg_name = region.name
    @place = region.rod_case
    @million_cities = region.cities.find_all_by_million(true)
    @cities = region.cities

    num = region.xlink
    cit = region.rand_city

    @xlink = Array.new
    @rand_city = Array.new

    for i in 0..2
      @xlink[i] = Xlink.find_by_id(num + i)
      if !@xlink[i]
        num = 0
        @xlink[i] = Xlink.find_by_id(num + i)
      end

      if @xlink[i].case == 0
        @rand_city[i] = City.find_by_id(cit + i)
        if !@rand_city[i]
          cit = 1
          @rand_city[i] = City.find_by_id(cit + i)
        end
        @rand_city[i] = @rand_city[i].pred_case
      else if @xlink[i].case == 1
            @rand_city[i] = City.find_by_id(cit + i)
            if !@rand_city[i]
              cit = 1
              @rand_city[i] = City.find_by_id(cit + i)
            end
            @rand_city[i] = @rand_city[i].rod_case
           end
      end
    end
  end

end
