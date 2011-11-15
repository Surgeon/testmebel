require 'will_paginate/array'
class CityController < ApplicationController

  def show

    if !params[:page]
      page = 0
    else
      page = params[:page]
    end

    if params[:category]
      @city = City.find_by_friendly_url(params[:friendly_url])

      @companies = Category.find_by_url(params[:category]).companies.where(:city_id => @city.id).paginate(:page => params[:page], :per_page => 10)
      current_category = Category.find_by_url(params[:category])
      @current_category_id = current_category.id
      @categories = Category.all
      @title_category = current_category.name
    else
      @city = City.find_by_friendly_url(params[:friendly_url])
      @companies = @city.companies.paginate(:page => params[:page], :per_page => 10)
      @categories = Category.all
      @current_category_id = 0
      @title = @city.rod_case
    end



    @place = @city.rod_case
    @region = Region.find(@city.region_id)
    

    if @city.id == 1072
      @head_text = t('head_text_msc')
      @text = t('text_msc')

    else
      @head_text = t('head_text_reg') + @region.rod_case + ' / ' + @place
      @text = t('text_reg_1') + YandexInflect.inflections(@region.name)[1] + ' / ' + YandexInflect.inflections(@city.name)[1] + t('text_reg_2') + YandexInflect.inflections(@region.name)[5] + ' / ' + @city.pred_case + t('text_reg_3')
    end

    @current_page = page

    @xlink = Array.new
    @rand_city = Array.new
    @case = Array.new

    num = @city.xlink
    cit = @city.rand_city


    for i in 0..2
      @xlink[i] = Xlink.find_by_id(num + i)
      if !@xlink[i]
        num = 0
        @xlink[i] = Xlink.find_by_id(num + i)
      end

      if @xlink[i].case == 0
        @rand_city[i] = City.find_by_id(cit + i)
        if !@rand_city[i]
          cit = 2
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
    end #end of loop
    @pop_companies = Company.random_where("city_id = "  + @city.id.to_s)
  end

  def search_results

    if !params[:page]
      page = 0
    else
      page = params[:page]
    end

    @keyword = params[:keyword]

    @city = params[:city]


    @companies = Array.new
    if (params[:keyword] != '') and (params[:city] != '')
      cities = City.where("name LIKE '%" + params[:city] + "%'")
      cities.each do |city|
        comp = Company.where("( name LIKE '%" + params[:keyword] + "%' ) and ( city_id = " + city.id.to_s + " ) ")
        @companies = @companies + comp
      end
      @companies = @companies.paginate(:page => params[:page], :per_page => 10)
    elsif (params[:keyword] != '')  and (params[:city] == '')
      @companies =  Company.where("name LIKE '%" + params[:keyword] + "%'").paginate(:page => params[:page], :per_page => 10)
    elsif (params[:keyword] == '') and (params[:city] != '')
      cities = City.where("name LIKE '%" + params[:city] + "%'")
      cities.each do |city|
        comp = Company.where(' city_id = ' + city.id.to_s)
        @companies = @companies + comp
      end
      @companies = @companies.paginate(:page => params[:page], :per_page => 10)
    else
      @companies = Company.all.paginate(:page => params[:page], :per_page => 10)
    end
  end

end
