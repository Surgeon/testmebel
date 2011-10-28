class CompanyController < ApplicationController
  def new
  end

  def show
    @company = Company.find(params[:id])
    @place = @company.city.rod_case

    @xlink = Array.new
    @rand_city = Array.new
    @case = Array.new
    num = @company.xlink
    cit = @company.rand_city

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
    @pop_companies = Company.random_where("city_id = "  + @company.city_id.to_s)

  end

  def contact
    if request.get?
      @city = params[:friendly_url]
      @company = params[:id]
    elsif request.post?
      Visitor.create(:name => params[:vis_name], :phone => params[:vis_phone], :email => params[:vis_email], :message => params[:vis_message], :company_id => params[:company_id])
      return 'Ok!'
    end

  end

end
