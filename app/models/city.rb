class City < ActiveRecord::Base

  validates :name, :presence => true

  has_many :companies
  belongs_to :region

  before_create :rand_xlink

  def rand_xlink
    r_id = rand(Xlink.maximum('id'))
    self.xlink = r_id

    c_id = City.find_by_sql("SELECT id FROM cities")
    r_id = rand(c_id.length)
    self.rand_city = c_id[r_id].id
  end
end
