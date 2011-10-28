class Company < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :phones
  has_many :visitors
  belongs_to :city

  before_create :rand_xlink

  def rand_xlink
    r_id = rand(Xlink.maximum('id'))
    self.xlink = r_id

    c_id = City.find_by_sql("SELECT id FROM cities")
    r_id = rand(c_id.length)
    self.rand_city = c_id[r_id].id
  end

  def self.random
    a = Array.new
    if (c = count) != 0
      a[0] = find(:first, :offset =>rand(c))
      a[1] = find(:first, :offset =>rand(c))
      a[2] = find(:first, :offset =>rand(c))
    end
    return a
  end

  def self.random_where(*params)
    a = Array.new
    if (c = where(*params).count) != 0
      a[0] = where(*params).find(:first, :offset =>rand(c))
      a[1] = where(*params).find(:first, :offset =>rand(c))
      a[2] = where(*params).find(:first, :offset =>rand(c))
    end
    return a
  end
end
