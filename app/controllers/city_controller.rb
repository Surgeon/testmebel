class CityController < ApplicationController

  def show
    if !params[:page]
      page = 0
    else
      page = params[:page]
    end
    puts page
    if params[:category]
      @city = City.find_by_friendly_url(params[:friendly_url])
      @current_category = Category.find_by_url(params[:category])
      @current_category_id = @current_category.id
      all_companies = @current_category.companies.where(:city_id == @city.id).size
      @companies = @current_category.companies.where(:city_id == @city.id).limit((page.to_i * 5).to_s + ',5')
      @categories = Category.all
    else
      @city = City.find_by_friendly_url(params[:friendly_url])
      all_companies = @city.companies.size
      @companies = @city.companies.limit((page.to_i * 5).to_s + ',5')
      @categories = Category.all
      @current_category_id = 0
    end
    @place = @city.rod_case
    @region = Region.find(@city.region_id)

    @page_size = (all_companies / 5)
    if (all_companies % 5) != 0
      @page_size = @page_size + 1
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
    end #end of loop
    @pop_companies = Company.random_where("city_id = "  + @city.id.to_s)
  end

  def search_results
    @companies = Array.new
    if (params[:keyword] != '') and (params[:city] != '')
      cities = City.where("name LIKE '%" + params[:city] + "%'")
      cities.each do |city|
        comp = Company.where("( name LIKE '%" + params[:keyword] + "%' ) and ( city_id = " + city.id.to_s + " ) ")
        @companies = @companies + comp
      end
    elsif (params[:keyword] != '')  and (params[:city] == '')
      @companies =  Company.where("name LIKE '%" + params[:keyword] + "%'")
    elsif (params[:keyword] == '') and (params[:city] != '')
      cities = City.where("name LIKE '%" + params[:city] + "%'")
      cities.each do |city|
        comp = Company.find_all_by_city_id(city.id)
        @companies = @companies + comp
      end
    end
  end

end
