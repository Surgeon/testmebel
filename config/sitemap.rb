# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.mebelincity.ru"

SitemapGenerator::Sitemap.create do


  Company.find_each do |content|
    add '/company/'+content.city.friendly_url + '/' + content.id.to_s + '.html', :lastmod => content.updated_at
  end

  City.find_each do |content|
    add '/city/' + content.friendly_url + '.html', :lastmod => content.updated_at
    Category.find_each do |cat|
      add '/city/' + content.friendly_url + '/' + cat.url + '.html', :lastmod => content.updated_at
    end
  end


  Region.find_each do |content|
    add '/' + content.friendly_url + '.html', :lastmod => content.updated_at
  end

  NewsItem.find_each do |content|
    add '/news/' + content.id.to_s + '.html', :lastmod => content.updated_at
  end


  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
