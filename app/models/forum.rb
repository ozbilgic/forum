class Forum < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  
  def to_param
    name
  end
end
