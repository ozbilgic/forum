class Forum < ActiveRecord::Base
  has_many :topics, dependent: :destroy
  has_many :comments, through: :topics

  validates :name, presence: true, uniqueness: true
  
  def to_param
    name
  end
end
