class User < ActiveRecord::Base
  has_secure_password
  has_many :topics,    dependent: :destroy
  has_many :comments,  dependent: :destroy
  
  validates :username,        presence: true,
                              uniqueness: {case_sensitive: false},
                              length: {in: 4..12},
                              exclusion: {in: ['oturum_ac']}
  validates :first_name,      presence: true
  validates :last_name,       presence: true
  validates :email,           presence: true,
                              uniqueness: {case_sensitive: false},
                              email: true
  validates :password_digest, presence: true,
                              length: {minimum: 4}

  def to_param
    username
  end

  def avatar_url(size=160)
    hash_value = Digest::MD5.hexdigest(email.downcase)
    "http://www.gravatar.com/avatar/#{hash_value}?s=#{size}"
  end
end
