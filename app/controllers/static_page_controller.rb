class StaticPageController < ApplicationController
  def about
    @about_body = StaticPage.find_all_by_name('about')
  end

  def contacts
    @contacts_body = StaticPage.find_all_by_name('contacts')
  end
end
