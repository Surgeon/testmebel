class RegionController < ApplicationController


  def index

    @regions = Region.find(:all, :order => "name ASC")
    #@million_cities = City.find_all_by_million(2)
    @million_cities = City.where(:million => 2).order("name ASC")
    @main_news = NewsItem.last
    @news = NewsItem.find(:all, :limit => "2,4", :order => "updated_at DESC")
    @articles = Article.find(:all, :limit => 4)


  end

  def show
    @region = Region.find_by_friendly_url(params[:friendly_url])

    @reg_name = @region.name
    @place = @region.rod_case
    @million_cities = @region.cities.find_all_by_million(2)
    @cities = @region.cities
    @title = YandexInflect.inflections(@region.name)[1]

    @head_text = t('head_text_reg') + @place
    @text = t('text_reg_1') + @place + t('text_reg_2') + @place + t('text_reg_3')

    num = @region.xlink
    cit = @region.rand_city

    @xlink = Array.new
    @rand_city = Array.new
    @case = Array.new

    for i in 0..2
      @xlink[i] = Xlink.find_by_id(num + i)
      if !@xlink[i]
        num = 1
        @xlink[i] = Xlink.find_by_id(num + i)
      end

      if @xlink[i].case == 0
        @rand_city[i] = City.find_by_id(cit + i)
        if !@rand_city[i]
          cit = 1
          @rand_city[i] = City.find_by_id(cit + i)
        end
        @case[i] = @rand_city[i].pred_case
      else if @xlink[i].case == 1
            @rand_city[i] = City.find_by_id(cit + i)
            if !@rand_city[i]
              cit = 1
              @rand_city[i] = City.find_by_id(cit + i)
            end
            @case[i] = @rand_city[i].rod_case
           end
      end
    end
    @pop_companies = []
    @region.cities.each do |city|
      puts city.companies.size
      if city.companies.size > 2
        @pop_companies = Company.random_where('city_id = ' + city.id.to_s)
        break
      end
    end


  end

end
